---
title: Spécification technique Indicateur de confiance
lang: fr-CA
author:
    - Clayton H. Lewis
    - Justin Obara
    - Joseph Scheuhammer
    - Julia Stoyanovich
    - Jason J.G. White
---

## Remarque {-}

Ce document constitue une version provisoire destinée à une consultation publique. Les
corrections, clarifications et suggestions d’amélioration portant sur l’ensemble du
document sont les bienvenues. Les types de commentaires supplémentaires suivants sont
particulièrement recherchés :

* Des exemples de préjudices ayant résulté ou pouvant résulter de l’utilisation de
    systèmes d’intelligence artificielle, notamment dans des cas de valeurs aberrantes.
    Les préjudices démontrés par des systèmes antérieurs (n’utilisant pas l’apprentissage
    automatique) sont également pertinents, dans la mesure où ils s’appliquent.
* Des stratégies non abordées dans cette version permettant de réduire le risque de
    discrimination lié à l’utilisation de systèmes d’intelligence artificielle,
    directement ou indirectement, dans la prise de décision.
* Des exemples ou analyses montrant lesquelles des stratégies présentées dans cette
    version se sont avérées efficaces pour atténuer les risques en pratique.

Les commentaires peuvent être soumis par les moyens suivants :

* Créer des tickets dans le [dépôt
    GitHub](https://github.com/inclusive-design/trust-meter/issues) du projet, idéalement
    un commentaire par ticket.

* Envoyer un courriel à Vera Roberts à l’adresse
    [vroberts@ocadu.ca](mailto:vroberts@ocadu.ca)

----

## Problème

En statistique, une valeur aberrante est « une observation qui s’écarte de façon anormale
des autres valeurs dans un échantillon aléatoire d’une population ».[^1] Le fait
d’appartenir à un ou plusieurs groupes sociaux faisant l’objet de discrimination
systémique peut faire en sorte que les données relatives à une personne correspondent à
une valeur aberrante dans les informations fournies à un système d’intelligence
artificielle (IA). Ce statut de valeur aberrante ne découle pas uniquement de
l’appartenance à ce groupe. Il faut plutôt y voir le résultat des nombreuses différences
pouvant exister entre les circonstances, l’histoire et les expériences vécues des membres
de ces groupes et celles de populations plus larges. Si un système d’intelligence
artificielle ne répond pas adéquatement à la situation particulière d’une personne, telle
qu’elle est reflétée dans les données qui lui sont fournies, il existe un risque de
renforcer ou de perpétuer la discrimination.

Ce risque est particulièrement élevé lorsque le système est utilisé, directement ou
indirectement, pour prendre des décisions ayant une incidence sur les droits de la
personne ou d’autres intérêts juridiques. Lorsque des différences liées, par exemple, au
genre, à la race, à l’origine ethnique, à la situation socioéconomique ou au handicap
deviennent déterminantes dans le fonctionnement des systèmes d’intelligence artificielle
en raison de la sous-représentation ou de la mauvaise représentation des valeurs
aberrantes dans les données, il en résulte un risque accru de décisions discriminatoires.
Des pratiques établies de marginalisation sociale s’en trouvent ainsi renforcées, ce qui
va à l’encontre des obligations morales et des normes relatives aux droits de la
personne.

[^1]:  NIST/SEMATECH e-Handbook of Statistical Methods, [section
7.1.6](https://www.itl.nist.gov/div898/handbook/prc/section1/prc16.htm).

## Objectif

Le présent document vise à mettre en évidence certains des problèmes que les outils
d’intelligence artificielle peuvent poser aux personnes appartenant à des groupes sociaux
marginalisés, ainsi qu’à proposer des approches pour y remédier. Il met l’accent sur les
problèmes qui découlent du fait qu’une personne est perçue comme différente des autres,
ou représentée comme telle, plutôt que sur ceux qui résultent de biais présents dans les
outils d’intelligence artificielle en raison de caractéristiques de groupe saillantes,
comme le genre, l’origine ethnique, le handicap ou une combinaison de ces
caractéristiques.

## Portée

Les termes de référence définissent la portée du présent rapport comme suit.

>Le Indicateur de confiance est une spécification technique non normative portant sur la
>discrimination statistique à l’égard des valeurs aberrantes dans les données et des
>petites minorités dans les processus de raisonnement statistique automatisé des outils
>de prise de décision fondés sur l’intelligence artificielle. La spécification technique
>Indicateur de confiance constitue un cadre visant à fournir des orientations aux
>personnes responsables de la mise en œuvre de systèmes d’intelligence artificielle, afin
>de les aider à comprendre et à anticiper les préjudices potentiels. Par exemple,
>lorsqu’une décision porte sur un cas, un groupe ou une personne qui se situe hors
>distribution par rapport à l’ensemble de données d’entraînement du modèle, les résultats
>du système d’intelligence artificielle peuvent s’avérer peu fiables dans ce contexte.

Compte tenu de la diversité des systèmes d’intelligence artificielle susceptibles
d’intervenir dans la prise de décision, la portée est interprétée selon les éléments
suivants :

- La spécification technique s’applique aux systèmes de classification fondés sur
  l’apprentissage automatique utilisés dans la prise de décision.
- Elle s’applique également aux systèmes qui fournissent de l’information ou des
  recommandations destinées à éclairer un processus décisionnel.
- Les orientations sont non normatives et visent à appuyer les personnes responsables de
  la mise en œuvre, de l’exploitation et de l’évaluation des systèmes.
- Elles présentent des concepts, des risques et des stratégies d’atténuation susceptibles
  d’éclairer l’élaboration de normes futures.
- Le présent rapport fournit des orientations de base visant à soutenir l’adoption, sans
  toutefois prescrire d’exigences de conformité.

## Types d’outils d’intelligence artificielle

Les outils d’intelligence artificielle peuvent être classés selon deux dimensions : leur
**fonction** et la **manière** dont ils produisent des résultats.

Les **outils** d’**IA spécifiques à une tâche** sont conçus et entraînés pour exécuter
une tâche spécifique ou un ensemble de tâches.

- *Supervisés *: l’outil apprend à partir d’exemples pour lesquels la bonne réponse est
  fournie par un être humain. Par exemple, un filtre antipourriel est entraîné sur des
  milliers de courriels, chacun étant étiqueté « pourriel » ou « non pourriel ».
_ *Non supervisés :* l’outil repère des schémas ou des structures dans les données sans
  qu’on lui fournisse de réponses correctes à l’avance. Par exemple, un outil de
  segmentation de la clientèle regroupe les consommateurs selon leur comportement d’achat
  sans qu’on lui indique quelles devraient être les catégories.

Les **outils** d’**IA à usage général** peuvent être utilisés pour de nombreuses tâches
dans divers domaines.

- *Discriminatifs :* l’outil analyse, classe ou récupère de l’information sans produire
  de nouveau contenu. Par exemple, un moteur de recherche classe des pages Web selon leur
  pertinence par rapport à une requête, et un modèle d’intégration (embeddings) à usage
  général peut être utilisé pour la recherche, la classification ou le regroupement dans
  plusieurs domaines.
- *Génératifs :* l’outil produit du nouveau contenu, comme du texte, des images ou du
  code. Par exemple, les grands modèles de langage (GML), comme ChatGPT, peuvent répondre
  à des questions, résumer des documents, traduire du texte ou générer du code à partir
  d’instructions formulées sous forme d’invite.

En pratique, de nombreux outils combinent des éléments de ces deux catégories. Un modèle
à usage général est souvent **adapté** à une tâche spécifique grâce à différents
mécanismes :

- *Apprentissage par transfert :* un modèle discriminatif à usage général, préentraîné
  pour produire des représentations utiles des données, peut être adapté à une tâche
  spécifique à l’aide d’une quantité relativement faible de données spécifiques à une
  tâche. Par exemple, un modèle entraîné à reconnaître des caractéristiques générales
  dans des images peut être adapté pour détecter des défauts de fabrication sur une
  chaîne de production. En apprentissage profond, cela consiste généralement à conserver
  le modèle de base tel quel et à entraîner une couche supplémentaire par-dessus; dans
  d’autres cas, les paramètres du modèle peuvent être ajustés plus largement.
- *Ajustement fin :* un modèle génératif à usage général peut être entraîné davantage sur
  des exemples spécifiques à une tâche afin d’améliorer ses performances dans un domaine
  donné. Par exemple, un grand modèle de langage à usage général peut être entraîné sur
  des documents juridiques supplémentaires afin d’améliorer ses performances en recherche
  juridique.
- *Apprentissage en contexte :* plutôt que d’effectuer un entraînement supplémentaire,
  des exemples ou des instructions peuvent être inclus directement dans l’invite fournie
  au modèle. Le modèle s’en sert pour orienter sa réponse. Cela met en évidence une
  capacité importante des modèles à usage général : leur comportement peut être influencé
  par le contenu même de l’entrée.
- *Récupération :* puisqu’il est difficile d’intégrer de nouvelles informations à un
  modèle après son entraînement, de nombreux outils sont donc conçus pour consulter des
  sources de données externes. Par exemple, ils peuvent effectuer des recherches sur le
  Web ou interroger des bases de données privées, comme des dossiers clients ou des
  politiques organisationnelles. Cela permet à l’outil d’utiliser de l’information à jour
  et spécifique qui ne faisait pas partie des données d’entraînement.

## Discrimination statistique

Lorsqu’un système d’intelligence artificielle utilisé dans des processus décisionnels
manifeste un biais à l’égard de certaines personnes en raison de caractéristiques
présumées, souvent stéréotypées, des groupes marginalisés auxquels elles appartiennent,
il contribue à la *discrimination statistique*. Cette forme de discrimination est
généralement problématique sur les plans moral et juridique. Elle peut se manifester
lorsque l’identité de groupe d’une personne est explicitement fournie à un système d’IA.
Elle peut aussi se manifester lorsque cette identité est absente des données accessibles
au système, mais influence néanmoins les décisions par l’intermédiaire de variables
substitutives. Par exemple, si les membres d’une minorité ethnique sont concentrés dans
un quartier ségrégué, un système d’IA peut « apprendre » à discriminer les résidents de
ce quartier, celui-ci servant alors de substitut à l’identité ethnique marginalisée.

Même en l’absence de telles variables, les caractéristiques des personnes appartenant à
des groupes marginalisés peuvent différer de celles des cas typiques ou moyens pour
lesquels les systèmes d’IA sont généralement plus fiables. Par exemple, une personne peut
présenter un statut socioéconomique inférieur à la moyenne ou un parcours professionnel
interrompu à plusieurs reprises, ce qui augmente le risque de mauvaise classification.

Quelle que soit la manière dont elle se manifeste, la discrimination statistique a pour
effet d’automatiser et de renforcer les préjugés, les stéréotypes et les pratiques
discriminatoires existants à l’égard des groupes marginalisés. La technologie de l’IA
agit ainsi comme un amplificateur des inégalités sociales. Les algorithmes
d’apprentissage automatique permettent à des hypothèses négatives concernant ces groupes
d’être intégrées dans les systèmes et d’influencer les décisions ultérieures, parfois de
manière difficile à anticiper.

Les valeurs aberrantes sont particulièrement exposées à ce type de discrimination, en
raison de la sous-représentation de leurs capacités, besoins et situations dans les
données d’entraînement. Le handicap en constitue un exemple particulièrement pertinent :
il correspond souvent à un écart par rapport à une norme sociale, ce qui fait en sorte
que les données relatives aux personnes concernées peuvent être traitées comme des
valeurs aberrantes dans des contextes décisionnels.

Prévenir et atténuer les erreurs de classification ou les traitements inappropriés des
valeurs aberrantes dans les outils d’IA peut ainsi être compris comme une stratégie
visant à réduire les formes immorales et illégales de discrimination statistique.

## Problèmes potentiels pour les groupes marginalisés

Les différents types d’outils d’intelligence artificielle posent des problèmes distincts,
auxquels correspondent des solutions différentes. La discussion qui suit est organisée en
fonction des problèmes eux-mêmes, en précisant quels types d’outils y sont les plus
susceptibles d’être concernés.

### Problèmes de représentation

Un problème évident découle de la **sous-représentation** : les exemples utilisés pour
concevoir ou orienter un outil peuvent ne pas refléter la diversité des situations ou des
besoins des personnes, en particulier celles exposées au risque de discrimination.
Lorsque les membres de groupes marginalisés et leurs situations ne sont pas représentés
dans l’élaboration d’un outil, celui-ci risque de produire des réponses inappropriées.
Cela concerne tout outil qui apprend à partir de données, qu’il soit spécifique à une
tâche ou à usage général, et que les exemples soient utilisés lors de l’entraînement
initial, de l’ajustement fin ou dans les invites.

Un problème connexe, mais distinct, est celui de la **mauvaise représentation** : les
données d’entraînement peuvent inclure des membres d’un groupe, mais dans des proportions
ou des contextes qui ne reflètent pas la réalité. Par exemple, si un outil de recrutement
est entraîné à partir de données historiques dans lesquelles les femmes sont
sous-représentées dans des postes de direction, l’outil peut apprendre à associer la
position hiérarchique aux hommes, non pas parce que les femmes sont absentes des données,
mais parce que ces données reflètent des schémas de discrimination passés plutôt que les
qualifications réelles. Le groupe est présent, mais l’image que le modèle en construit
est déformée.

Un cas extrême de mauvaise représentation concerne les **valeurs aberrantes** : certains
groupes ou individus sont si peu présents dans les données d’entraînement que le modèle
ne dispose pas d’assez d’exemples pour en apprendre les caractéristiques — il n’y a tout
simplement pas suffisamment de données pour produire des statistiques fiables.

### Problèmes de performance

Les outils d’intelligence artificielle sont généralement évalués à l’aide de **mesures de
performance agrégées**, c’est-à-dire un seul indicateur qui résume leur performance sur
l’ensemble des exemples. Ces mesures favorisent naturellement les bons résultats dans les
cas les plus fréquents, puisque ce sont eux qui contribuent le plus au score global. Un
outil peut ainsi sembler bien fonctionner dans l’ensemble tout en étant peu fiable pour
des groupes ou des individus dont les situations sont moins fréquentes. Par exemple, un
modèle qui évalue correctement des candidats ayant un parcours professionnel typique peut
sembler bien fonctionner dans l’ensemble, mais donner de mauvais résultats pour des
personnes ayant un parcours atypique, comme une personne en situation de handicap ayant
des interruptions dans son parcours d’emploi.

Il ne s’agit pas simplement d’erreurs rares. Le processus d’entraînement pousse le modèle
à construire une représentation simplifiée et approximative des données, plus précise
pour les cas fréquents que pour les cas moins fréquents. Les personnes déjà exposées au
risque de discrimination présentent souvent des caractéristiques qui s’écartent de la
moyenne sur des aspects pertinents, ce qui augmente la probabilité d’obtenir des
résultats peu fiables, même lorsque leurs données sont incluses dans les données
d’entraînement.

La performance peut également être **instable** : de légères variations dans les données
d’entrée peuvent produire des résultats très différents. Par exemple, [Wang et
al.](https://www.nature.com/articles/s41746-024-01029-4.pdf) ont montré que des questions
médicales apparemment équivalentes recevaient des réponses différentes de la part de
systèmes d’IA générative. Une forme particulière de ce phénomène est la complaisance de
l’intelligence artificielle, où l’outil adapte sa réponse à ce que l’utilisateur semble
vouloir. Ces problèmes concernent tous les utilisateurs, mais peuvent avoir un impact
particulier sur les personnes dont les situations sont déjà mal représentées dans le
modèle, car celui-ci dispose de moins d’éléments sur lesquels s’appuyer, ainsi que sur
les personnes ayant des limitations cognitives, qui peuvent être moins en mesure de
détecter et de corriger des résultats peu fiables.

### Perte de contexte

Les outils d’intelligence artificielle sont façonnés par les données et les
environnements dans lesquels ils ont été développés. Le contexte renvoie ici non
seulement aux conditions dans lesquelles le modèle a été entraîné (données, domaine et
population), mais aussi à l’information et aux éléments d’ancrage nécessaires pour
produire des résultats fiables. Lorsque l’un ou l’autre de ces éléments de contexte fait
défaut, la fiabilité peut se dégrader de manière difficile à anticiper.

**Généralisation hors contexte.** Un outil peut être utilisé dans un environnement, une
population ou un domaine différent de celui dans lequel il a été entraîné ou évalué. Par
exemple, un outil de recrutement entraîné à partir de données provenant d’un secteur
donné peut produire des résultats peu fiables dans un autre, ou un modèle entraîné
principalement sur des textes en anglais peut produire des résultats peu fiables dans
d’autres langues ou contextes culturels. Cela concerne à la fois les outils spécifiques à
une tâche et les outils à usage général, et pose des risques particuliers pour les
groupes marginalisés, dont les contextes sont moins susceptibles d’avoir été représentés
dans l’environnement d’origine de l’outil.

**Fabrication.** Les systèmes d’IA générative produisent parfois des informations
plausibles, mais fausses, par exemple en citant des sources inexistantes. Ce phénomène
est parfois appelé hallucination. Le modèle ne dispose pas du contexte nécessaire pour
distinguer ce qu’il sait de ce qu’il invente. Il ne s’agit pas uniquement d’un problème
lié à une utilisation hors de son contexte d’entraînement : ce phénomène découle de la
nature même de l’entraînement génératif, dans lequel le modèle apprend à produire des
résultats plausibles, sans en vérifier le fondement. La fabrication peut donc survenir
même dans des domaines bien représentés dans les données d’entraînement. Ce problème
concerne tous les utilisateurs, mais peut avoir des conséquences particulières pour les
personnes ayant des limitations cognitives, qui peuvent être moins en mesure de détecter
et de corriger ces résultats.

**Erreurs de récupération.** De nombreux outils peuvent consulter des sources de données
externes, comme le Web ou des bases de données privées, afin de compenser les limites des
données d’entraînement. Toutefois, cela introduit de nouveaux risques : l’outil peut
formuler sa requête de manière inadéquate, récupérer des informations non pertinentes ou
obsolètes, ou mal interpréter les résultats obtenus. L’outil fonctionne alors dans un
contexte (c’est-à-dire la source de données externe) sur lequel il n’a pas été
directement entraîné. Il ne dispose pas des éléments nécessaires pour naviguer, évaluer
et interpréter de manière fiable les informations provenant de ces sources, et la
fiabilité de ces opérations n’est pas garantie.

Dans chacun de ces cas, l’outil fonctionne sans disposer d’un contexte suffisant pour
encadrer de manière fiable son comportement. Les personnes dont les situations sont
inhabituelles ou sous-représentées sont donc plus susceptibles d’être affectées par ces
lacunes.

### Opacité

Notre compréhension du fonctionnement réel des systèmes d’intelligence artificielle
complexes est encore très limitée. Bien que leur structure et leur fonctionnement de base
soient entièrement connus, la manière dont un tel système réagit à une situation donnée
dépend d’un grand nombre de paramètres qui interagissent de manière extrêmement complexe.
Par conséquent, lorsqu’un problème survient, il est souvent difficile de déterminer
comment le corriger. Un entraînement supplémentaire (ajustement fin) ou l’ajout de
contenu dans les invites peut parfois fonctionner, mais il reste difficile d’en être
certain, ou de prévoir comment ces corrections peuvent affecter d’autres aspects du
comportement du système. Cela ne constitue pas directement un problème pour les
utilisateurs, mais pose des défis pour les concepteurs d’outils.

Cela concerne tout outil fondé sur des modèles complexes, qu’il soit spécifique à une
tâche ou à usage général.

## Atténuation des problèmes

Les problèmes décrits dans la section précédente varient selon le type de système
d’intelligence artificielle concerné. Les problèmes de **représentation** affectent tout
système qui apprend à partir de données, mais sont plus marqués dans les **systèmes
supervisés spécifiques à une tâche**, où les exemples d’entraînement déterminent
directement ce que le système peut ou non traiter efficacement. Les **problèmes de
performance**, y compris la fragilité et la complaisance, sont surtout caractéristiques
des **systèmes génératifs à usage général**, bien que la sensibilité aux valeurs
aberrantes touche également les systèmes spécifiques à une tâche. La **perte de
contexte** peut survenir dans tous les types de systèmes, mais sous des formes
différentes : pour les systèmes spécifiques à une tâche, elle survient lorsque le système
est utilisé en dehors de son domaine d’entraînement, tandis que pour les systèmes
génératifs à usage général, elle se manifeste par des hallucinations et des erreurs de
récupération. L’**opacité**, comme indiqué précédemment, est une condition qui s’applique
à tous les systèmes d’IA complexes, quel que soit leur type.

Les mesures d’atténuation varient également selon le type de système et sont présentées
ici par stratégie plutôt que par problème, puisqu’une même stratégie permet souvent de
traiter plusieurs problèmes à la fois. Dans chaque stratégie, nous précisons lorsque les
orientations s’appliquent à un type particulier de système d’IA. Les cinq stratégies
sont : les **stratégies de gouvernance**, qui portent sur la question fondamentale de
savoir si et comment l’IA doit être utilisée dans un contexte décisionnel donné; les
**stratégies relatives aux données**, qui concernent la collecte et la préparation des
données d’entraînement ainsi que des exemples utilisés par le système; les **stratégies
architecturales**, qui portent sur la conception et la construction des systèmes; les
**stratégies de déploiement**, qui concernent l’exploitation des systèmes; et les
**stratégies de suivi et d’amélioration**, qui concernent l’évaluation et la correction
des systèmes au fil du temps. L’opacité, qui tient à notre capacité limitée à comprendre
pourquoi les systèmes d’IA complexes se comportent comme ils le font, réduit la confiance
que l’on peut accorder aux mesures d’atténuation et doit être prise en compte dans
l’ensemble des sous-sections.

Cette section développe plus en détail les orientations applicables aux systèmes
supervisés spécifiques à une tâche et aux systèmes génératifs à usage général, car ce
sont les types pour lesquels les risques et les mesures d’atténuation sont les mieux
compris. Les systèmes non supervisés spécifiques à une tâche et les systèmes
discriminatifs à usage général soulèvent des préoccupations similaires, abordées
lorsqu’elles sont pertinentes, mais qui sont susceptibles de nécessiter un
approfondissement à mesure que la compréhension de ces systèmes évolue.

### Stratégies de gouvernance

Le risque de discrimination statistique décrit dans ce rapport doit être pris en compte
avec soin pour déterminer *si* les outils d’IA doivent intervenir dans une décision
donnée et, le cas échéant, *quel* rôle ils doivent y jouer. À un certain stade du
développement d’un projet logiciel fondé sur l’IA, ces risques doivent être évalués et
des choix stratégiques doivent être faits quant à la **poursuite du projet**, à ses
**objectifs** et à son **contexte social**. À ce stade, un système de recherche ou un
prototype peut déjà exister, ou le projet peut encore être au stade de proposition. Dans
tous les cas, une évaluation des risques s’impose, en tenant compte des mesures
d’atténuation disponibles.

Le risque de discrimination statistique doit être comparé aux risques associés aux
approches non automatisées visant le même objectif. Les décideurs humains peuvent
eux-mêmes être biaisés à l’égard de cas atypiques; une procédure entièrement manuelle
comporte donc également un risque de discrimination. Des programmes de formation, des
initiatives de sensibilisation à la diversité et des exigences en matière d’équité
procédurale peuvent réduire ce risque sans toutefois l’éliminer. Il faut donc déterminer
si l’automatisation permettrait d’améliorer l’équité de la prise de décision par rapport
aux approches manuelles, en particulier pour les membres de groupes marginalisés.

Dans certaines situations, un système d’IA peut être **utilisé comme nouveau point
d’accès** à des informations ou à des services existants, plutôt que comme substitut à la
prise de décision humaine. Un tel système peut échouer plus souvent face à des demandes
moins courantes, ce qui peut en soi être discriminatoire. Il est donc nécessaire de
comparer l’accès réel que les utilisateurs obtiendraient avec et sans le système d’IA, en
portant une attention particulière aux utilisateurs marginalisés.

Si un système d’IA est utilisé, il convient de mettre en place un contexte social
approprié, en veillant à ce que les personnes chargées de l’exploiter ou de le superviser
comprennent ses limites et puissent mettre en œuvre des mesures de surveillance et
d’atténuation. Cela suppose un certain degré de **transparence quant à son
fonctionnement**, aux situations dans lesquelles il est susceptible d’échouer et à ce
qu’il ne peut pas faire de manière fiable. Une telle transparence est nécessaire à une
supervision humaine effective; sans elle, les personnes responsables de l’exploitation ou
de l’examen du système ne peuvent pas exercer cette responsabilité de manière adéquate.

Une évaluation rigoureuse des risques au stade de la gouvernance repose sur une
compréhension du fonctionnement du système, des situations dans lesquelles il est
susceptible d’échouer et des personnes qui pourraient en être affectées. Cette
compréhension est limitée par l’opacité, qui varie selon la manière dont le système a été
obtenu. Pour les systèmes développés à l’interne, les développeurs ont accès aux données
d’entraînement, à l’architecture du modèle et aux résultats d’évaluation, et ils
contrôlent en grande partie le degré de transparence. Pour les systèmes acquis, y compris
la plupart des systèmes génératifs à usage général, l’organisation qui les déploie peut
ne pas avoir accès, en tout ou en partie, aux informations nécessaires à l’évaluation des
risques. Il en découle une distinction importante entre les développeurs, qui contrôlent
les propriétés fondamentales du système, et les responsables du déploiement, qui en
assurent l’utilisation dans un contexte donné, tout en disposant d’une visibilité limitée
sur son fonctionnement. Les deux parties sont responsables des résultats du déploiement,
mais les mesures d’atténuation à leur disposition diffèrent considérablement, et le degré
de prudence appliqué au stade de la gouvernance devrait en tenir compte.

### Stratégies relatives aux données

La mesure d’atténuation la plus fondamentale des problèmes de représentation consiste à
utiliser des données d’entraînement vastes et inclusives, reflétant la diversité des
personnes et des situations que le système rencontrera lors de son déploiement. Cela est
simple en principe, mais exigeant en pratique. Les personnes diffèrent de nombreuses
façons importantes, et ces différences interagissent souvent : connaître des personnes
présentant l’attribut A et des personnes présentant l’attribut B ne suffit pas à
comprendre celles qui possèdent les deux. Une couverture adéquate des cas combinant
plusieurs attributs exige beaucoup plus de données qu’une couverture des attributs pris
isolément, et une couverture complète peut ne pas être réalisable. Lorsqu’elle ne l’est
pas, il ne faut pas considérer le système comme adéquat pour tous les cas, mais plutôt
documenter explicitement les limites de couverture et signaler les cas qui se situent en
dehors de ces limites, approche à laquelle nous revenons dans les sections **Stratégies
architecturales** et **Surveillance et amélioration**.

Pour les systèmes non supervisés spécifiques à une tâche, les lacunes de représentation
prennent une forme particulière. Plutôt que de produire des résultats mal classés, un
groupe sous-représenté peut devenir invisible : trop petit ou trop diffus pour former un
groupe distinct, il peut être absorbé dans un groupe dominant auquel il ne correspond pas
réellement, ou fragmenté en plusieurs groupes de manière à masquer plutôt qu’à refléter ses
caractéristiques. Le même principe de collecte de données inclusives s’applique, mais
l’évaluation est plus difficile, puisqu’il n’existe pas d’étiquette de référence
permettant de déterminer si le système a correctement regroupé les individus.

L’importance des choix de données varie selon le type de système. Pour les systèmes
supervisés spécifiques à une tâche, les données d’entraînement constituent le principal
moyen d’action et sont en grande partie sous le contrôle des développeurs. Pour les
systèmes à usage général, les responsables du déploiement n’ont généralement aucun
contrôle sur les données d’entraînement; comme indiqué dans la section Gouvernance, cette
responsabilité incombe aux développeurs. Toutefois, quel que soit le type de système, les
responsables du déploiement conservent un contrôle significatif sur d’autres données
d’entrée, qui doivent être gérées avec le même soin que les données d’entraînement :

- _Données d’ajustement fin_. Lorsqu’un système à usage général est adapté à un cas
d’usage spécifique par ajustement fin, les données utilisées doivent elles-mêmes être
représentatives de la population que le système servira, y compris les groupes
marginalisés. Un système dont les performances sont globalement bonnes peut fonctionner
moins bien pour certains groupes si les données d’ajustement fin ne reflètent pas leur
situation.
- _Exemples en contexte_. Pour les systèmes façonnés par apprentissage en contexte, les
exemples inclus dans les invites constituent une forme de données et comportent les mêmes
risques de représentation. Il convient de veiller à ce que ces exemples n’excluent pas
systématiquement certains groupes ni ne les représentent de manière inexacte.
- _Corpus de récupération_. Pour les systèmes qui consultent des sources de données
externes, le contenu de ces sources constitue lui aussi une forme de données qui
influence le comportement du système. Ces corpus doivent être évalués en termes de
couverture et de risques de mauvaise représentation, et mis à jour régulièrement.

Pour les systèmes discriminatifs à usage général, notamment les modèles d’embeddings
(représentations vectorielles) utilisés pour la recherche ou la classification, la
qualité des représentations produites dépend de l’étendue et de l’équilibre des données
d’entraînement. Un modèle entraîné sur des données qui sous-représentent certains groupes
produira des représentations de moindre qualité pour ces groupes, avec des effets sur
toutes les tâches ultérieures. Les responsables du déploiement utilisant des modèles
acquis devraient obtenir des informations sur les données d’entraînement auprès des
développeurs et évaluer les performances du modèle pour les groupes et contextes
pertinents.

Dans tous les cas, la mauvaise représentation est un enjeu aussi important que la
sous-représentation. Les données peuvent inclure certains groupes dans des proportions ou
des contextes qui ne reflètent pas la réalité, par exemple, lorsque des données
historiques intègrent des schémas de discrimination passés. La sélection et la
préparation des données doivent donc porter non seulement sur la présence des groupes,
mais aussi sur la manière dont ils sont représentés.

Les stratégies relatives aux données peuvent réduire les lacunes de représentation, mais
l’opacité limite la capacité à en vérifier l’efficacité. Même avec des données
d’entraînement inclusives, il est difficile de confirmer qu’un modèle complexe traite
correctement les groupes sous-représentés, car la relation entre les données
d’entraînement et le comportement du modèle n’est pas transparente. L’évaluation sur des
ensembles de données distincts fournit des éléments probants, mais pas de certitude. Les
responsables du déploiement doivent donc considérer ces stratégies comme nécessaires,
mais non suffisantes pour garantir un traitement équitable.

### Stratégies architecturales

Les stratégies architecturales correspondent aux choix de conception d’un système et
constituent l’un des moyens les plus directs de réduire les risques décrits dans la
section précédente. Certaines de ces stratégies sont accessibles tant aux développeurs
qu’aux responsables du déploiement, tandis que d’autres, notamment celles qui nécessitent
un accès aux composantes internes du modèle, relèvent principalement des développeurs.
Comme indiqué dans la section Gouvernance, les responsables du déploiement de systèmes
acquis devraient chercher à obtenir des informations auprès des développeurs sur les
mesures d’atténuation architecturales mises en place et documenter clairement les mesures
supplémentaires qu’ils ont eux-mêmes adoptées.

#### Détection des cas hors distribution

Pour les systèmes supervisés spécifiques à une tâche, une mesure d’atténuation
architecturale consiste à ajouter une étape de traitement qui évalue la similarité de
chaque nouveau cas avec les exemples sur lesquels le système a été entraîné. Les cas qui
diffèrent sensiblement de ces exemples sont hors distribution, et le comportement du
système dans de tels cas est moins fiable. Détecter ces cas avant que le système ne
réponde permet de les orienter vers un traitement particulier, par exemple vers un
examinateur humain, plutôt que de les traiter comme s’ils relevaient pleinement du
domaine de compétence du système. Il existe une gamme de méthodes pour ce type
d’évaluation, et le choix approprié dépend de la nature des données et du système.
L’exigence clé est que la méthode soit validée sur les données spécifiques que le système
rencontrera en déploiement, et non uniquement sur des ensembles de données de référence.

Cette mesure d’atténuation est directement liée aux stratégies relatives aux données
présentées ci-dessus : la documentation des limites de couverture des données
d’entraînement constitue une condition préalable à l’identification des cas susceptibles
d’être hors distribution. Ensemble, ces deux stratégies constituent la base d’une
approche structurée du traitement des cas inhabituels.

#### Garde-fous

Les garde-fous sont des mécanismes qui examinent les entrées d’un système ou ses sorties
et interviennent pour modifier ou contraindre la réponse du système. Ils s’appliquent à
tous les types de systèmes, bien que leur mise en œuvre diffère. Un garde-fou peut
informer un utilisateur que le système ne peut pas répondre de manière fiable à un
certain type de question; il peut signaler des entrées pour lesquelles la réponse du
système est susceptible d’être peu fiable; ou il peut orienter ces entrées vers un
traitement alternatif plutôt que de les bloquer purement et simplement. Les garde-fous
peuvent également être utilisés pour détecter et signaler les cas hors distribution, en
complément de la stratégie de détection décrite ci-dessus.

Pour les systèmes génératifs à usage général, les garde-fous sont particulièrement
importants, car la variété des entrées possibles est essentiellement illimitée. Un
garde-fou ne peut pas anticiper tous les modes de défaillance, mais il peut être conçu
pour détecter des catégories connues d’entrées ou de sorties problématiques. Les
responsables du déploiement conservent un contrôle significatif sur les garde-fous, même
lorsqu’ils ont un accès limité aux composantes internes du modèle; leur mise en œuvre
relève donc autant de leur responsabilité que de celle des développeurs. Lorsque des
garde-fous sont intégrés à un système acquis, les responsables du déploiement devraient
chercher à comprendre leur champ d’application et leurs limites.

#### Contraintes de récupération

Pour les systèmes génératifs qui consultent des sources de données externes, les choix
architecturaux relatifs à la mise en œuvre de la récupération peuvent réduire à la fois
les problèmes d’hallucination et de perte de contexte. Lorsqu’il est possible de limiter
le système à des réponses fondées sur le contenu récupéré plutôt que générées librement,
le risque de fabrication est réduit. Une forme plus contraignante de cette approche
consiste à mettre en œuvre la récupération sous forme de flux de données, dans lequel les
réponses proviennent directement d’une source fiable, une fois que le système l’a
identifiée, plutôt que d’être générées par le système lui-même. Cela n’élimine pas les
erreurs de récupération, mais supprime la capacité du système à fabriquer du contenu sans
fondement dans le contenu source.

#### Complaisance de l’intelligence artificielle

La complaisance de l’intelligence artificielle, qui désigne la tendance d’un système à
adapter ses réponses à ce qu’un utilisateur semble vouloir plutôt qu’à ce qui est exact,
est traitée principalement au moyen de techniques d’alignement mises en œuvre par les
développeurs lors de l’entraînement et échappe en grande partie au contrôle des
responsables du déploiement. L’ajustement fin sur des exemples soigneusement sélectionnés
peut aider, mais il reste difficile de vérifier que ces ajustements réduisent de manière
fiable la complaisance de l’intelligence artificielle sans affecter d’autres aspects du
comportement du système. Les responsables du déploiement disposent ici de peu de moyens
architecturaux; la conception des invites offre certaines possibilités d’atténuation et
est abordée dans la section Stratégies de déploiement.

#### Sélection et remplaçabilité des modèles

Les problèmes décrits dans la section précédente, en particulier la fabrication et la
perte de contexte, varient considérablement selon les modèles, et les modèles plus
récents corrigent souvent des modes de défaillance connus. Les développeurs devraient
suivre les taux d’échec des tâches spécifiques prises en charge par leur système et
évaluer si des modèles alternatifs ou plus récents permettent de les réduire. Pour
rendre cela possible, les systèmes doivent être conçus de manière à ce que le modèle
sous-jacent puisse être remplacé sans nécessiter une refonte majeure. Cela implique
d’éviter un couplage étroit à l’API ou aux capacités d’un seul fournisseur dans le code,
ainsi qu’une dépendance contractuelle envers ce fournisseur. La sélection des modèles
n’est pas une décision ponctuelle, mais une démarche continue, et l’architecture doit en
tenir compte.

#### Opacité

L’opacité limite la confiance que l’on peut accorder aux mesures d’atténuation
architecturales décrites ici. La détection des cas hors distribution peut signaler des
situations inhabituelles, mais ne permet pas de déterminer pleinement pourquoi un système
est susceptible d’y échouer. Les garde-fous peuvent intercepter des modes de défaillance
connus, mais ne peuvent pas anticiper ceux qui ne sont pas encore compris. Les
contraintes de récupération réduisent la fabrication sans l’éliminer, et il est difficile
de vérifier qu’un système respecte effectivement ces contraintes en pratique. Les
responsables de la mise en œuvre devraient considérer les mesures d’atténuation
architecturales comme des mesures de réduction des risques plutôt que comme des mesures
d’élimination des risques.

### Stratégies de déploiement

Les stratégies de déploiement portent sur l’exploitation des systèmes d’intelligence
artificielle une fois en production. Contrairement aux stratégies présentées dans les
sections précédentes, les stratégies de déploiement relèvent presque entièrement de la
responsabilité des entités chargées du déploiement et s’appliquent, que le système ait
été développé à l’interne ou acquis auprès d’un fournisseur.

#### Supervision humaine

Compte tenu des incertitudes liées aux systèmes d’intelligence artificielle, les
responsables du déploiement doivent assurer une supervision humaine effective de leur
fonctionnement. Cette mesure est particulièrement importante pour les situations
inhabituelles, qui, comme indiqué dans les sections précédentes, sont les plus
susceptibles d’être mal traitées. Lorsqu’un mécanisme de détection des cas hors
distribution est mis en place comme mesure architecturale, la pratique consiste à
acheminer les cas signalés vers des évaluateurs humains. En l’absence d’un tel mécanisme,
les responsables du déploiement doivent établir d’autres critères permettant d’identifier
les situations nécessitant une évaluation humaine.

Une difficulté pratique se pose lorsqu’un système fonctionne correctement dans la
majorité des situations : l’attention portée à la supervision tend à diminuer lorsque les
erreurs sont rares. Pour assurer une vigilance soutenue, une approche consiste à
introduire périodiquement des cas synthétiques dont la réponse correcte est connue et
pour lesquels un type d’erreur précis est probable, sans que l’évaluateur sache qu’il
s’agit de cas synthétiques. Cela permet de vérifier si la supervision humaine est
effectivement exercée et d’intervenir lorsque l’attention diminue.

La supervision humaine n’est efficace que si elle est assurée par des personnes possédant
les connaissances nécessaires pour évaluer la pertinence d’une réponse, y compris dans
des situations inhabituelles. Confier cette responsabilité à des personnes ne disposant
pas de ces connaissances revient à créer une impression de sécurité sans fondement réel.

#### Rétroaction des utilisateurs et recours

Les personnes les plus concernées par le bon fonctionnement d’un système sont souvent
celles dont les situations y sont traitées. Les responsables du déploiement doivent donc
mettre en place des mécanismes accessibles permettant aux utilisateurs de signaler que
leur situation n’a pas été traitée correctement. Lorsque des droits juridiques ou des
intérêts importants sont en jeu, des procédures efficaces de recours et de révision
doivent être établies afin d’assurer une supervision humaine effective des décisions
contestées.

Les mécanismes de rétroaction doivent également prévoir un accès à une assistance
humaine, afin de permettre aux utilisateurs de contourner le système automatisé lorsque
leur situation n’a pas été traitée de manière satisfaisante. Il s’agit à la fois d’une
mesure d’équité et d’une mesure pratique : les utilisateurs qui ne peuvent obtenir une
assistance appropriée par l’intermédiaire d’un système automatisé ne se contenteront pas
d’une réponse inadéquate, et les coûts associés aux défaillances non résolues peuvent
être considérables.

#### Conception des invites

Pour les systèmes génératifs à usage général, la conception des invites constitue un
moyen d’action dans le cadre du déploiement pour atténuer plusieurs des problèmes décrits
dans la section précédente. Le fait d’intégrer explicitement, dans l’invite, des éléments
de contexte relatifs à la situation de l’utilisateur peut réduire les erreurs liées à une
perte de contexte, le système étant moins susceptible de répondre de manière inappropriée
lorsque les circonstances pertinentes sont précisées plutôt que supposées. Varier
délibérément la formulation d’une requête et comparer les réponses obtenues permet
également de mettre en évidence un manque de robustesse : si des requêtes
substantiellement identiques donnent lieu à des réponses sensiblement différentes, la
fiabilité du système pour ce type de requête est remise en question. En ce qui concerne
la complaisance de l’intelligence artificielle, des instructions explicites dans l’invite
demandant au système de ne pas adapter sa réponse aux préférences perçues de
l’utilisateur peuvent atténuer ce phénomène, bien que la fiabilité de cette approche soit
difficile à vérifier et qu’elle ne doive pas être considérée comme une solution complète.

La conception des invites incombe aux responsables du déploiement, mais son efficacité
est limitée par les propriétés du modèle sous-jacent, sur lesquelles ils n’ont pas de
contrôle. Les responsables du déploiement doivent donc considérer la conception des
invites comme un complément et non comme un substitut aux stratégies architecturales et
aux stratégies liées aux données présentées dans les sections précédentes.

L’opacité pose un défi particulier pour la supervision humaine en contexte de
déploiement. Les personnes chargées d’examiner les résultats produits par un système
d’intelligence artificielle complexe ne peuvent généralement pas comprendre pourquoi le
système a produit une réponse donnée, ce qui limite leur capacité à en évaluer la
fiabilité ou à anticiper la manière dont il pourrait échouer dans des situations
similaires à l’avenir. Les mécanismes de rétroaction et les procédures de recours
permettent de constater qu’un problème est survenu, mais ne permettent généralement pas
d’en expliquer la cause. Les responsables du déploiement doivent informer clairement les
évaluateurs humains de cette limite et concevoir des processus de supervision qui ne
reposent pas sur l’hypothèse que ces derniers peuvent pleinement apprécier le
raisonnement à l’origine des résultats du système.

### Stratégies de suivi et d’amélioration

Les **essais** constituent une mesure d’atténuation essentielle, mais leur portée et leur
fiabilité diffèrent sensiblement de celles des essais appliqués aux logiciels classiques.
Pour ces derniers, l’ensemble des entrées valides est défini à l’avance et chaque entrée
correspond à une sortie correcte; les essais peuvent donc être menés de manière
systématique et leur couverture peut être mesurée.

Pour les systèmes supervisés spécifiques à une tâche, une situation comparable peut se
présenter dans des cas simples où les entrées sont contraintes à un format défini. Même
dans ces cas, il n’est toutefois pas toujours évident de déterminer la réponse correcte
pour une entrée présentant une combinaison inhabituelle de caractéristiques. Les essais
doivent examiner le comportement du système dans l’ensemble des situations qu’il
rencontrera dans le cadre du déploiement, en accordant une attention particulière aux
situations impliquant des groupes sous-représentés dans les données d’entraînement.

Pour les systèmes génératifs à usage général, la situation est nettement plus complexe.
La flexibilité qui rend ces systèmes utiles (entrées non contraintes et sorties ne devant
pas prendre de forme particulière) rend également les essais systématiques difficiles.
Les essais peuvent accroître la confiance dans le fonctionnement adéquat d’un système,
mais ils ne peuvent offrir le degré de certitude que permettent souvent les essais de
logiciels classiques. En pratique, les essais automatisés des systèmes génératifs
reposent généralement sur d’autres systèmes génératifs pour évaluer les sorties, ce qui
introduit de nouvelles incertitudes.

Dans les deux cas, les essais doivent cibler en priorité les situations inhabituelles et
les cas limites, car ce sont les plus susceptibles d’être mal traités et les moins
susceptibles d’être détectés par des essais fondés sur des entrées typiques.

L’opacité complique davantage l’évaluation par essais des systèmes d’intelligence
artificielle. Même lorsqu’un système réussit une batterie d’essais soigneusement conçue,
il reste difficile de comprendre pourquoi il produit une réponse donnée. Il est également
difficile d’établir si de bonnes performances dans les cas testés garantissent un
comportement fiable dans les cas non testés. Cela est particulièrement vrai pour les
situations inhabituelles impliquant des groupes marginalisés, pour lesquelles la
couverture des essais est la plus difficile à assurer et les conséquences d’une
défaillance les plus graves.

**Amélioration continue.** Lorsqu’un système produit des réponses incorrectes ou
inadéquates, les responsables du déploiement doivent pouvoir intervenir. Le mécanisme
dépend du type de système.

Pour les systèmes supervisés spécifiques à une tâche, l’approche principale consiste à
réentraîner le modèle. Cela implique d’intégrer des cas corrigés aux données
d’entraînement, puis de réentraîner le modèle, ou d’utiliser des techniques ciblées,
comme l’apprentissage actif, afin d’identifier les cas où le système commet le plus
d’erreurs et d’en prioriser l’annotation. Tout réentraînement doit être suivi de tests
pour vérifier que les performances s’améliorent pour les cas ciblés, sans se dégrader
ailleurs.

Pour les systèmes génératifs à usage général, le réentraînement n’est généralement pas
accessible aux responsables du déploiement. Dans ce contexte, deux approches peuvent être
envisagées. D’abord, si le système dispose de capacités de récupération, il est possible
de lui fournir une base de cas passés et de leur traitement approprié, afin qu’il puisse
s’y référer pour traiter des situations similaires. Ensuite, des cas corrigés accompagnés
de leurs réponses peuvent être intégrés aux invites, en tirant parti de la capacité des
systèmes génératifs à apprendre à partir d’exemples fournis dans l’invite. Ces deux
approches nécessitent un suivi afin d’en confirmer l’effet, puisqu’aucune ne garantit une
généralisation fiable.

Quel que soit le type de système, les processus d’amélioration doivent eux-mêmes faire
l’objet d’une supervision. Des corrections efficaces en phase de test peuvent ne pas
s’appliquer de manière fiable à de nouveaux cas. De plus, des modifications visant à
améliorer les performances dans un domaine peuvent entraîner des effets inattendus
ailleurs. En raison de l’opacité des systèmes d’intelligence artificielle complexes, il
est rarement possible de confirmer avec certitude qu’une amélioration fonctionne. Il est
seulement possible d’en augmenter la probabilité au moyen de tests et d’un suivi
rigoureux.

## Conclusion

Les systèmes d’intelligence artificielle offrent un réel potentiel pour améliorer la
qualité et la cohérence des décisions et des services, malgré les contraintes de
ressources auxquelles font face les responsables du développement, de la mise en œuvre et
du déploiement. Toutefois, ce potentiel comporte des risques bien réels. Un système peut
bien fonctionner dans l’ensemble, mais échouer dans des situations atypiques, là où les
personnes ont le plus besoin d’un traitement fiable et équitable.

Les mesures d’atténuation décrites dans la présente spécification ne suppriment pas ces
risques. Les stratégies liées aux données peuvent réduire les lacunes de représentation,
sans pouvoir les combler entièrement. Les approches architecturales et les mécanismes de
déploiement permettent d’identifier et de rediriger les cas inhabituels, mais reposent
sur une compensation partielle de l’opacité par la transparence. Les mécanismes de suivi
et d’amélioration corrigent des défaillances connues, sans garantir que ces corrections
s’appliquent à d’autres situations. Enfin, la gouvernance permet d’encadrer les décisions
de déploiement, mais ne remplace pas une vigilance soutenue une fois les systèmes en
opération.

La présente spécification fournit un cadre structuré pour exercer cette vigilance : elle
propose une méthode pour évaluer, à chaque étape du développement et du déploiement, si
les risques pour les groupes marginalisés ont été pris au sérieux et si les mesures
d’atténuation disponibles ont été mises en œuvre. Cela ne garantit pas l’équité, mais en
constitue une condition nécessaire.

## Remerciements

Nous remercions sincèrement les personnes suivantes pour leur contribution à ce projet.

* Prithy Ahmed, Conseil canadien des normes
* Clayton H. Lewis, University of Colorado Boulder
* Cindy Li, OCAD University
* Justin Obara, OCAD University
* Vera Roberts, OCAD University
* David Rokeby, University of Toronto
* Joseph Scheuhammer, OCAD University
* Julia Stoyanovich, New York University
* Jutta Treviranus, OCAD University
* Jason J.G. White, participant à titre individuel

## Droit d’auteur et licence

La présente publication est protégée par le droit d’auteur © 2026 OCAD University et est
distribuée selon les modalités de la licence [Creative Commons Attribution – Partage dans
les mêmes conditions 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.fr).
