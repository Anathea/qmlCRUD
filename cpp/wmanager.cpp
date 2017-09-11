#include "wmanager.h"
#include <QApplication>

#include <QDir>
#include <QFileDialog>
#include <iostream>

using namespace std;

WManager::WManager(QObject *parent) : QObject(parent)
{
    qDebug() << "WManager::instance construite ";

    // 1/2 Initialisation des valeurs pour le QML avant chargement du fichier
    // propriétés simples
    setPropString("");//.... in .cpp 1/3  : Rajout propriété du Context QML
}

void WManager::load()
{
    QList<QString> fichiersQML;
    // Chargement d'une ou plusieurs fenêtres avec pour fichiers sources :
    fichiersQML << QString("qml"); // pour un fichier racine QML : "qml.qml"

    for (int t = 0; t < 1; t++)
    {
        makeQMLtab(fichiersQML[t]);
        std::cout << "tab " << t << " ready." << std::endl;
    }
}

void WManager::makeQMLtab(QString nomFichierQMLsansExtension)
{
    QQuickView* view = new QQuickView();
    quickViews.push_back(view);

    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->setGeometry(QRect(120, 120, 850, 700));

    // Mise en mémoire des objets pour communiquer avec le QML (avant le chargement de la page)
    m_QMLcontexts << view->engine()->rootContext();

    m_qmlContext = m_QMLcontexts.at(0);
    m_qmlContext->setContextProperty("Context", this->getInstance());
    //

    // 2/2 Initialisation des valeurs pour le QML avant chargement du fichier
    // Initialisation des modèles (même vides)
    QStringList listeVide;
    updateQML_model("listeEntierPourEvaluation", listeVide);
    updateQML_model("UnModelARenseigner", listeVide);
    //

    QString repertoireProjet = getRepertoireProjet(); // Pour Windows
//    QString repertoireProjet = "/home/anathea/Programmation/qmlCRUD"; // Pour Linux
    QString fichierQML = repertoireProjet + QString("/qml/") + nomFichierQMLsansExtension + QString(".qml");
    std::cout  << "charge le fichier QML : " << fichierQML.toLatin1().constData() << std::endl;

    // Chargement du fichier QML
    view->setSource(QUrl::fromLocalFile(fichierQML));
    view->show();
}

// Permet d'afficher des informations sur les répertoires du projet en cours
// Dans le paramétrage du projet "Project", necessite que "shadow build" soit décoché
QString WManager::getRepertoireProjet(bool trace)//false
{
    QString repertoireduFichierApplication(qApp->applicationFilePath());
    if (trace)
        std::cout << "qApp->applicationFilePath() = "<< repertoireduFichierApplication.toLatin1().constData() << std::endl;

    QDir fichier(repertoireduFichierApplication);
    fichier.cdUp();
    fichier.cdUp();
    if (trace)
        std::cout << "qApp->applicationName() = "<< qApp->applicationName().toLatin1().constData() << std::endl;

    fichier.cd(qApp->applicationName());
    QString repertoireProjet  = fichier.absolutePath();
    if (trace)
        std::cout  << "repertoireProjet : " << repertoireProjet.toLatin1().constData() << std::endl;

    return repertoireProjet;
}

void WManager::displayInitialInformations()
{
    getRepertoireProjet(true);
}

// ............................................................
// Mise à jour du modele de xxxxView du QML (du type Context.nomModele)
void WManager::updateQML_model(QString nomModele, QStringList sl)
{
    m_qmlContext = m_QMLcontexts.at(0);
    m_qmlContext->setContextProperty(nomModele, QVariant::fromValue(sl));
}

void WManager::testActionQML(int i)
{
    qDebug() << "WManager::testActionQML : " << i;
}

// Fonction appelée à partir du QML pour exécuter une action C++
void WManager::sendActionToCpp(QString nomAction, QString parametre/*=""*/)
{
    qDebug() << "WManager::sendActionfromQML : nomAction = " << nomAction;
    qDebug() << "WManager::sendActionfromQML : parametre = " << parametre;

    if (nomAction == "ajouterLigne")
    {
        m_aOfTablo.push_back(parametre);
    }
    else if (nomAction == "autreAction")
    {
        // Détail d'une autre action appelée à partir du C++
    }
    updateQML_model("UnModelARenseigner", m_aOfTablo);
}

//................ Rajout d'une propriété du Context pour le QML .............
//.... in .cpp 2/3  : Rajout propriété du Context QML
void WManager::setPropString(const QString &a)
{
    if (a != m_propString)
    {
        m_propString = a;
        emit propStringChanged();
    }
}

//.... in .cpp 3/3  : Rajout propriété du Context QML
QString WManager::propString_r() const
{
    return m_propString;
}
