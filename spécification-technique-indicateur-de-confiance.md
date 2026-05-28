---
title: Spécification technique Indicateur de confiance
subtitle: Lutter contre la discrimination statistique envers les minorités et les valeurs aberrantes dans l’intelligence artificielle et l’analytique des données
lang: fr-CA
---

## Problème[^1]

Dans le contexte des systèmes d’intelligence artificielle, une valeur aberrante est une
personne dont les données se situent à l’extérieur ou à la limite de l’ensemble
d’exemples à partir duquel un modèle apprend à reconnaître des schémas et à faire des
prédictions.  Cela peut se produire lorsque les circonstances, les antécédents, le
comportement ou les caractéristiques d’une personne sont peu représentés dans les données
utilisées pour entraîner, ajuster ou orienter le système. Lorsqu’une personne se situe en
dehors des schémas que le modèle a appris à interpréter adéquatement, le risque qu’elle
ne soit pas comprise correctement augmente, tout comme celui que le système produise une
classification, une recommandation ou une décision inexacte. Le fait d’appartenir à un ou
plusieurs groupes sociaux faisant l’objet de discrimination systémique peut accroître la
probabilité qu’une personne soit traitée ainsi par un système d’intelligence artificielle
(IA). Cela ne doit pas être interprété comme découlant uniquement de l’appartenance au
groupe en soi, mais plutôt des nombreuses façons dont les circonstances, les antécédents
et les expériences de vie des membres de ces groupes peuvent différer de ceux de
populations plus larges.

Si le système d’intelligence artificielle ne répond pas adéquatement à la situation
particulière d’une personne telle qu’elle ressort des données qui lui sont présentées, il
existe un risque que la discrimination soit amplifiée ou perpétuée. Le risque est le plus
élevé lorsque le système est utilisé directement ou indirectement pour prendre des
décisions touchant les droits de la personne ou d’autres intérêts juridiques. Lorsque des
différences liées, par exemple, au genre, à la race, à l’origine ethnique, à la situation
socioéconomique ou au handicap deviennent déterminantes dans le fonctionnement des
systèmes d’intelligence artificielle en raison de la sous-représentation ou de la
représentation erronée des valeurs aberrantes dans les données, le risque de décisions
discriminatoires augmente. Les efforts visant à corriger ces disparités par des
ajustements algorithmiques ou l’augmentation des données peuvent non seulement s’avérer
inefficaces, mais aussi imposer à ces communautés des contraintes disproportionnées en
matière de protection de la vie privée. Des pratiques établies de marginalisation sociale
s’en trouvent ainsi renforcées, contrairement aux obligations morales et aux normes
relatives aux droits de la personne.

[^1]: Cette section s’inspire du concept de « discrimination statistique » tel qu’il est
  défini dans la norme [CAN-ASC-6.2:2025, Systèmes d’intelligence artificielle accessibles et équitables](https://accessibilite.canada.ca/elaboration-normes-accessibilite/asc-62-systemes-intelligence-artificielle-accessibles-equitables),
  et présente le défi visé par la présente spécification technique, y compris les risques
  associés aux cas hors distribution et aux valeurs aberrantes. La présente spécification
  vise à appuyer la mise en œuvre de la norme CAN-ASC-6.2:2025 et la conformité à
  celle-ci.

## Objectif

Le présent document vise à présenter certains des problèmes que les outils d’intelligence
artificielle peuvent poser aux membres de groupes sociaux marginalisés, ainsi que des
approches permettant d’atténuer ces problèmes. Il met l’accent sur les problèmes qui
découlent du fait qu’une personne est différente des autres, ou représentée comme telle,
plutôt que sur les biais qui surviennent lorsque des outils d’intelligence artificielle
peuvent intégrer des attitudes biaisées à l’égard d’une personne en raison de
caractéristiques de groupe saillantes, comme le genre, l’origine ethnique, le handicap ou
une combinaison de ces caractéristiques.

## Portée

Les termes de référence définissent la portée du présent rapport comme suit.

>Le Indicateur de confiance est une spécification technique non normative portant sur la
>discrimination statistique visant les valeurs aberrantes dans les données et les petites
>minorités dans les processus de raisonnement statistique automatisé des outils de prise
>de décision fondés sur l’intelligence artificielle. La spécification technique
>Indicateur de confiance constitue un cadre fournissant des orientations aux responsables
>de la mise en œuvre de systèmes d’intelligence artificielle afin de les aider à
>comprendre et à anticiper les préjudices potentiels. Par exemple, lorsqu’une décision
>porte sur un cas, un groupe ou une personne se situant hors distribution par rapport à
>l’ensemble de données sur lequel le modèle a été entraîné, les décisions du système
>d’intelligence artificielle dans ce contexte peuvent être peu fiables.

Compte tenu de la diversité des systèmes d’intelligence artificielle susceptibles de
jouer un rôle dans la prise de décision, la portée est interprétée selon les éléments
additionnels suivants :

* La spécification technique s’applique aux systèmes de classification fondés sur
  l’apprentissage automatique utilisés dans la prise de décision.
* Elle s’applique également aux systèmes qui fournissent de l’information ou des
  recommandations destinées à être prises en compte par une personne dans le cadre d’un
  processus décisionnel.
* Les orientations sont non normatives et visent à appuyer les responsables de la mise en
  œuvre, de l’exploitation et de l’évaluation des systèmes.
* Elles présentent des concepts, des risques et des stratégies d’atténuation susceptibles
  d’éclairer l’élaboration de futures normes.
* Le présent rapport fournit des orientations de base visant à soutenir l’adoption, sans
  toutefois prescrire d’exigences de conformité.

### Hors portée

La présente spécification se limite aux risques de discrimination statistique, de
mauvaise classification et de prise de décision peu fiable qui surviennent lorsque les
systèmes d’intelligence artificielle ne tiennent pas adéquatement compte des personnes
dont les circonstances sont sous-représentées, représentées de manière erronée ou situées
en dehors des schémas que le système a appris à bien traiter. Nous reconnaissons que les
systèmes appuyés par l’intelligence artificielle, ainsi que les centres de données et les
infrastructures qui les soutiennent, soulèvent de nombreuses autres préoccupations
importantes, notamment en matière de vie privée, de souveraineté des données, de manque
de transparence, d’impacts écologiques comme la consommation d’énergie et d’eau, et de
préjudices pour les communautés. Ces préoccupations sont importantes et méritent une
attention particulière, mais elles sont hors de la portée de la présente spécification.

Le Indicateur de confiance ne prescrit pas de techniques particulières de mise en œuvre
ou de suivi. Il peut indiquer ou suggérer des approches susceptibles d’éclairer
l’élaboration de telles techniques, mais toute méthode concrète de mise en œuvre ou de
suivi devrait être déterminée au cas par cas et au moyen de processus propres à chaque
système.

## Types d’outils d’intelligence artificielle

Les outils d’intelligence artificielle peuvent être regroupés selon deux dimensions :
**ce qu’ils sont conçus pour faire** et **la manière dont** ils produisent des résultats.

Les **outils** d’**IA spécifiques à une tâche** sont conçus et entraînés pour accomplir
une tâche particulière ou un ensemble de tâches.

* _Supervisés_ : l’outil apprend à partir d’exemples pour lesquels la bonne réponse a été
  fournie par une personne. Par exemple, un filtre antipourriel est entraîné à partir de
  milliers de courriels, chacun étant étiqueté « pourriel » ou « non pourriel ».
* _Non supervisés_ : l’outil repère des schémas ou des structures dans les données sans
  qu’on lui fournisse les bonnes réponses. Par exemple, un outil de segmentation de la
  clientèle regroupe les consommateurs selon leur comportement d’achat sans qu’on lui
  indique à l’avance quelles devraient être les catégories.

Les **outils** d’**IA à usage général** peuvent être appliqués à de nombreuses tâches
dans divers domaines.

* _Discriminatifs_ : l’outil analyse, classe ou récupère de l’information sans produire
  de nouveau contenu. Par exemple, un moteur de recherche classe des pages Web selon leur
  pertinence par rapport à une requête, et un modèle de plongement à usage général peut
  être utilisé pour la recherche, la classification ou le regroupement dans divers
  domaines.
* _Génératifs et agentiques_ : l’outil produit du nouveau contenu, comme du texte, des
  images ou du code, ou exécute des tâches en plusieurs étapes. Par exemple, les grands
  modèles de langage (GML), comme ChatGPT, peuvent répondre à des questions, résumer des
  documents, traduire du texte ou écrire du code à partir d’instructions fournies sous
  forme d’invite.
* _Agentiques_ : l’outil exécute des tâches en plusieurs étapes pour atteindre un
  objectif précis. Bien que souvent alimentés par des modèles génératifs, les systèmes
  agentiques vont plus loin en travaillant de manière semi-autonome pour planifier des
  actions, parcourir le Web, interagir avec d’autres logiciels et résoudre des problèmes
  complexes pour le compte de l’utilisateur.

En pratique, de nombreux outils combinent des éléments de ces catégories. Un modèle à
usage général est souvent **adapté** à une tâche spécifique au moyen de différents
mécanismes :

* _Apprentissage par transfert_ : un modèle discriminatif à usage général, préentraîné
  pour produire des représentations utiles des données, est adapté à une tâche spécifique
  à l’aide d’une quantité relativement faible de données d’entraînement propres à cette
  tâche. Par exemple, un modèle entraîné à reconnaître des caractéristiques générales
  dans des images peut être adapté pour détecter des défauts de fabrication précis sur
  une chaîne de production industrielle. En apprentissage profond, cela consiste souvent
  à conserver le modèle de base inchangé et à entraîner une petite couche supplémentaire
  par-dessus; dans d’autres contextes, les paramètres du modèle peuvent être ajustés plus
  largement.
* _Ajustement fin_ : un modèle génératif à usage général peut être entraîné davantage à
  partir d’exemples propres à une tâche afin d’améliorer ses performances dans un domaine
  particulier. Par exemple, un grand modèle de langage à usage général peut faire l’objet
  d’un ajustement fin à partir de documents juridiques afin d’être plus utile dans le
  cadre de recherches juridiques.
* _Apprentissage en contexte_ : plutôt que de recourir à un entraînement supplémentaire,
  des exemples ou des instructions peuvent être inclus directement dans l’invite fournie
  au modèle. Le modèle s’en sert pour orienter sa réponse. Cela exploite une capacité
  importante des modèles à usage général : leur comportement peut être influencé par le
  contenu même de l’entrée.
* _Récupération_ : puisqu’il est difficile d’ajouter de nouvelles informations à un
  modèle après son entraînement, de nombreux outils sont dotés de la capacité de
  consulter des sources de données externes. Par exemple, ils peuvent effectuer des
  recherches sur le Web ou consulter de l’information dans des bases de données privées,
  comme des dossiers clients ou des politiques organisationnelles. Cela permet à l’outil
  de s’appuyer sur de l’information actuelle et spécifique qui ne faisait pas partie des
  données d’entraînement.

## Aggravation des biais négatifs

Lorsqu’un système d’intelligence artificielle jouant un rôle dans la prise de décision
manifeste un biais à l’égard de certaines personnes en raison de caractéristiques
présumées, souvent stéréotypées, des groupes marginalisés auxquels elles appartiennent,
il contribue à la discrimination statistique. Cette forme de discrimination est
généralement problématique sur les plans moral et juridique. Elle peut survenir lorsque
l’identité de groupe d’une personne est explicitement communiquée à un système
d’intelligence artificielle. Elle peut également survenir lorsque l’identité de groupe
est absente des données mises à la disposition du système, mais devient néanmoins
déterminante dans les décisions par l’intermédiaire de variables substitutives. Par
exemple, si les membres d’une minorité ethnique sont concentrés dans un quartier
ségrégué, un système d’IA peut « apprendre » à discriminer les résidents de ce quartier,
qui sert alors de variable substitutive à l’identité ethnique marginalisée.

Même lorsque les variables substitutives ne sont pas en cause, les données relatives aux
membres de groupes marginalisés peuvent facilement différer des cas typiques ou moyens
pour lesquels les systèmes d’IA fonctionnent relativement bien. Par exemple, une personne
appartenant à un groupe marginalisé peut avoir un statut socioéconomique inférieur à la
moyenne ou un parcours professionnel fréquemment interrompu, ce qui augmente le risque de
mauvaise classification.

Quelle que soit la manière dont la discrimination statistique se manifeste dans le
fonctionnement d’un outil d’intelligence artificielle, elle a pour effet d’automatiser et
de renforcer les préjugés, les stéréotypes et les pratiques discriminatoires existants à
l’égard des groupes marginalisés. La technologie de l’intelligence artificielle devient
ainsi un amplificateur des inégalités sociales existantes. Les algorithmes
d’apprentissage automatique permettent à des présupposés négatifs à l’égard des groupes
marginalisés d’être intégrés dans un système d’intelligence artificielle et d’influencer
les décisions ultérieures, parfois de manière imprévisible.

Les valeurs aberrantes sont particulièrement exposées à la discrimination statistique en
raison de la sous-représentation de leurs capacités, besoins et situations variés dans
les données sur lesquelles un système est entraîné. Le handicap en constitue un exemple
particulièrement révélateur, puisqu’avoir un handicap revient essentiellement à s’écarter
d’une norme sociale et, par conséquent, à tendre vers une situation de valeur aberrante
dans des contextes influençant des décisions importantes.

Prévenir et atténuer les erreurs de classification ou les traitements inappropriés des
valeurs aberrantes dans les outils d’intelligence artificielle peut ainsi être compris
comme une stratégie visant à réduire les formes immorales et illégales de discrimination
statistique.

## Problèmes potentiels pour les groupes marginalisés

Les différents types d’outils d’intelligence artificielle présentent des problèmes
distincts, auxquels correspondent différentes solutions. La discussion qui suit est
organisée en fonction des problèmes eux-mêmes, et précise quels types d’outils y sont les
plus susceptibles d’être exposés.

### Problèmes de représentation

Un problème évident découle de la **sous-représentation** : les exemples utilisés pour
concevoir ou orienter un outil peuvent ne pas inclure d’exemples reflétant les situations
ou les besoins d’une diversité de personnes, en particulier celles exposées au risque de
discrimination. Il est clair que lorsque les membres de groupes marginalisés et leurs
situations ne sont pas représentés dans l’élaboration d’un outil, celui-ci risque de
produire des réponses inappropriées. Cela concerne tout outil qui apprend à partir de
données, qu’il soit spécifique à une tâche ou à usage général, et que les exemples soient
utilisés lors de l’entraînement initial, de l’ajustement fin ou dans les invites.

Un problème connexe, mais distinct, est celui de la **représentation erronée** : les
données d’entraînement peuvent inclure des membres d’un groupe, mais dans des proportions
ou des contextes qui ne reflètent pas la réalité. Par exemple, si un outil de recrutement
est entraîné à partir de données historiques dans lesquelles les femmes sont
sous-représentées dans des postes de direction, l’outil peut apprendre à associer les
postes de direction aux hommes, non pas parce que les femmes sont absentes des données,
mais parce que ces données reflètent des schémas de discrimination passés plutôt que les
qualifications réelles. Le groupe est présent, mais l’image que le modèle s’en fait est
déformée.

Un cas extrême de représentation erronée concerne les **valeurs aberrantes** : certains
groupes ou individus sont si peu présents dans les données d’entraînement que le modèle
ne dispose pas d’assez d’exemples pour en apprendre les caractéristiques – il n’y a tout
simplement pas assez de données pour produire des statistiques significatives.

### Problèmes de performance

Les outils d’intelligence artificielle sont généralement évalués à l’aide de **mesures de
performance agrégées**, c’est-à-dire d’un seul indicateur résumant leur performance sur
l’ensemble des exemples. Ces mesures favorisent naturellement les bons résultats dans les
cas les plus fréquents, puisque ce sont eux qui contribuent le plus au résultat global.
Un outil peut ainsi sembler bien fonctionner en moyenne tout en donnant de mauvais
résultats pour des groupes ou des individus dont les situations sont moins fréquentes.
Par exemple, un modèle qui évalue correctement des candidats ayant un parcours
professionnel typique peut sembler bien fonctionner en moyenne, mais donner de mauvais
résultats pour des personnes ayant un parcours atypique, comme une personne en situation
de handicap présentant des interruptions dans ses antécédents professionnels.

Il ne s’agit pas simplement d’erreurs rares. Le processus d’entraînement pousse le modèle
à construire une représentation simplifiée et approximative des données, plus précise
pour les exemples dont les caractéristiques sont fréquentes que pour ceux dont les
caractéristiques le sont moins. Les personnes déjà exposées au risque de discrimination
présentent souvent des caractéristiques qui s’écartent de la moyenne sur des aspects
pertinents et sont donc plus susceptibles d’obtenir des résultats peu fiables, même
lorsque leurs données sont incluses dans les données d’entraînement.

La performance peut également être **instable** : de légères variations dans les données
d’entrée peuvent produire des résultats différents de manière inattendue. Par exemple,
[Wang et al](https://doi.org/10.1038/s41746-024-01029-4). ont montré que des questions
médicales apparemment équivalentes recevaient souvent des réponses différentes de la part
de systèmes d’intelligence artificielle générative. Une forme particulière de ce
phénomène est la complaisance de l’intelligence artificielle, où l’outil adapte sa
réponse à ce que l’utilisateur semble vouloir entendre. Ces problèmes touchent tous les
utilisateurs, mais peuvent avoir un impact particulier sur les personnes dont les
situations sont déjà mal représentées dans le modèle, puisque celui-ci dispose de moins
d’éléments sur lesquels s’appuyer, ainsi que sur les personnes ayant des limitations
cognitives, qui peuvent être moins en mesure de détecter et de corriger des résultats peu
fiables. De plus, l’atténuation de ces disparités est complexe.
[Fulgu et Capraro (2024)](https://osf.io/preprints/psyarxiv/mp27q_v1) ont montré que des
tentatives visant à réduire de tels biais peuvent involontairement en créer de nouveaux.

### Perte de contexte

Les outils d’intelligence artificielle sont façonnés par les données et les contextes
dans lesquels ils ont été développés. Le contexte renvoie ici non seulement aux
conditions statistiques de l’entraînement (les données, le domaine et la population à
partir desquels l’outil a été développé), mais aussi à l’information et à l’ancrage
contextuel dont un outil a besoin pour produire des résultats fiables. Lorsque l’une ou
l’autre de ces formes de contexte fait défaut, la fiabilité peut se dégrader de manière
difficile à anticiper.

**Généralisation hors contexte** : Un outil peut être utilisé dans un contexte, une
population ou un domaine différent de celui dans lequel il a été entraîné ou évalué. Par
exemple, un outil de recrutement entraîné à partir de données provenant d’un secteur
donné peut produire de mauvais résultats dans un autre, ou un modèle entraîné
principalement sur des textes en anglais peut produire des résultats peu fiables dans
d’autres langues ou contextes culturels. Cela concerne à la fois les outils spécifiques à
une tâche et les outils à usage général, et pose des risques particuliers pour les
groupes marginalisés, dont les contextes sont moins susceptibles d’avoir été représentés
dans le contexte d’origine de l’outil.

**Fabrication** : Les systèmes d’intelligence artificielle générative produisent parfois
des informations plausibles, mais fausses, par exemple en citant des sources
inexistantes. Ce phénomène est parfois appelé hallucination. Le modèle ne dispose pas du
contexte nécessaire pour distinguer ce qu’il sait de ce qu’il invente. Il ne s’agit pas
uniquement d’un problème lié à une utilisation hors de son contexte d’entraînement : ce
phénomène découle de la nature même de l’entraînement génératif, dans lequel le modèle
apprend à produire des résultats plausibles sans en suivre le fondement probant. La
fabrication peut donc survenir même dans des domaines bien représentés dans les données
d’entraînement. Ce problème touche tous les utilisateurs, mais peut avoir des
conséquences particulières pour les personnes ayant des limitations cognitives, qui
peuvent être moins en mesure de détecter et de corriger des résultats fabriqués.

**Erreurs de récupération** : De nombreux outils sont dotés de la capacité de consulter
des sources de données externes, comme le Web ou des bases de données privées, afin de
compenser les limites de ce qui était inclus dans l’entraînement. Toutefois, cela
introduit de nouveaux risques : l’outil peut formuler sa requête de manière inadéquate,
récupérer des informations non pertinentes ou obsolètes, ou mal interpréter ce qu’il
trouve. L’outil fonctionne alors dans un contexte (c’est-à-dire la source de données
externe) sur lequel il n’a pas été entraîné directement. Il ne dispose pas de l’ancrage
contextuel nécessaire pour naviguer, évaluer et interpréter de manière fiable les
informations provenant de ces sources, et la fiabilité de ces opérations n’est pas
garantie.

Dans chacun de ces cas, l’outil fonctionne sans disposer d’un contexte suffisant pour
encadrer son comportement de manière fiable. Les personnes dont les situations sont
inhabituelles ou sous-représentées sont plus susceptibles de se retrouver en dehors de
ces limites et, par conséquent, d’être davantage touchées.

### Opacité

Notre compréhension du fonctionnement réel des systèmes d’intelligence artificielle
complexes demeure très limitée. Bien que leur structure et leur fonctionnement de base
soient entièrement connus, la manière dont un tel système réagit dans une situation
donnée dépend d’un très grand nombre de paramètres interagissant de manière extrêmement
complexe. Cela signifie que lorsqu’un problème survient, il est généralement difficile de
déterminer comment le corriger. Un entraînement supplémentaire (ajustement fin) ou
l’ajout de contenu dans les invites peut fonctionner, mais il reste difficile d’en être
certain ou de savoir comment ces corrections peuvent affecter d’autres aspects du
comportement du système. Cela ne constitue pas directement un problème pour les
utilisateurs, mais plutôt pour les concepteurs d’outils.

Cela concerne tout outil fondé sur des modèles complexes, qu’il soit spécifique à une
tâche ou à usage général.

## Atténuation des problèmes

Les problèmes décrits dans la section précédente se manifestent différemment selon le
type de système d’intelligence artificielle concerné. Les problèmes de
**représentation** affectent tout système qui apprend à partir de données, mais sont
particulièrement marqués dans les **systèmes supervisés spécifiques à une tâche**, où les
exemples d’entraînement déterminent directement ce que le système peut ou non traiter
efficacement. **Les problèmes de performance**, y compris l’instabilité et la
complaisance de l’intelligence artificielle, sont surtout caractéristiques des **systèmes
génératifs à usage général**, bien que la sensibilité aux valeurs aberrantes touche
également les systèmes spécifiques à une tâche. La **perte de contexte** peut survenir
dans tous les types de systèmes, mais sous des formes différentes : pour les systèmes
spécifiques à une tâche, elle survient lorsque le système est utilisé en dehors de son
domaine d’entraînement, tandis que pour les systèmes génératifs à usage général, elle se
manifeste par des hallucinations et des erreurs de récupération. L’**opacité**, comme
indiqué précédemment, est une condition qui s’applique à tous les systèmes d’intelligence
artificielle complexes, quel que soit leur type.

Les mesures d’atténuation varient également selon le type de système et sont présentées
ici par stratégie plutôt que par problème, puisqu’une même stratégie permet souvent de
répondre à plusieurs problèmes à la fois. Dans chaque stratégie, nous précisons lorsque
les orientations s’appliquent à un type particulier de système d’intelligence
artificielle. Les cinq stratégies sont : les **stratégies de gouvernance**, qui portent
sur la question fondamentale de savoir si et comment l’intelligence artificielle doit
être utilisée dans un contexte décisionnel donné; les **stratégies relatives aux
données**, qui concernent la collecte et la préparation des données d’entraînement ainsi
que des exemples utilisés par le système; les **stratégies architecturales**, qui portent
sur la conception et la construction des systèmes; les **stratégies de déploiement**, qui
concernent l’exploitation des systèmes; et les **stratégies de suivi et d’amélioration**,
qui concernent l’évaluation et la correction des systèmes au fil du temps. L’opacité, qui
tient à notre capacité limitée à comprendre pourquoi les systèmes d’intelligence
artificielle complexes se comportent comme ils le font, réduit la confiance que l’on peut
accorder aux mesures d’atténuation et doit être prise en compte dans l’ensemble des
sous-sections.

Cette section développe plus en détail les orientations applicables aux systèmes
supervisés spécifiques à une tâche et aux systèmes génératifs à usage général, car ce
sont les types de systèmes pour lesquels les risques et les mesures d’atténuation sont
les mieux compris. Les systèmes non supervisés spécifiques à une tâche et les systèmes
discriminatifs à usage général soulèvent des préoccupations similaires, qui sont
mentionnées lorsqu’elles sont pertinentes, mais qui pourraient nécessiter un
approfondissement à mesure que la compréhension de ces systèmes évolue.

### Stratégies de gouvernance

Le risque de discrimination statistique décrit à la section 1 du présent rapport doit
être soigneusement pris en compte pour déterminer _si_ les outils d’intelligence
artificielle doivent jouer un rôle dans un type donné de décision et, le cas échéant,
_quel_ rôle ils doivent y jouer. À un certain stade du développement d’un projet logiciel
fondé sur l’intelligence artificielle, ces risques doivent être évalués et des choix
stratégiques doivent être faits quant à la **poursuite du projet**, à ses **objectifs**
et à son **contexte social**. À ce stade, un système de recherche ou un prototype
exploratoire peut déjà exister; à l’inverse, le projet peut encore n’être qu’une
proposition. Dans tous les cas, une évaluation des risques s’impose, en tenant compte des
mesures d’atténuation disponibles.

Le risque de discrimination statistique doit être mis en balance avec les risques
associés aux moyens non automatisés permettant d’atteindre le même objectif. Les
décideurs humains peuvent eux-mêmes avoir des biais à l’égard des cas atypiques; une
procédure entièrement manuelle comporte donc également un risque de discrimination. Des
programmes de formation, des initiatives de sensibilisation à la diversité et des
exigences en matière d’équité procédurale peuvent réduire ce risque sans toutefois
l’éliminer. Il faut donc faire des choix difficiles quant à savoir si l’automatisation
permettrait d’améliorer l’équité de la prise de décision par rapport aux approches
manuelles, particulièrement pour les membres de groupes marginalisés.

Dans certaines situations, un système d’intelligence artificielle peut être **conçu comme
une nouvelle voie d’accès** à des informations ou à des services existants, plutôt que
comme substitut à la prise de décision humaine. Un tel système peut échouer plus souvent
lorsqu’il est confronté à des demandes moins courantes, ce comportement pouvant lui-même
être discriminatoire. Il est donc nécessaire de comparer l’accès auquel les utilisateurs
auraient réellement accès avec et sans le système d’intelligence artificielle, en portant
une attention particulière aux utilisateurs marginalisés.

Si un système d’intelligence artificielle doit être utilisé, il convient de mettre en
place un contexte social approprié, en veillant à ce que les personnes chargées de
l’exploiter ou de le superviser soient en mesure de comprendre ses limites et de mettre
en œuvre des mesures de surveillance et d’atténuation. Cela suppose un certain degré de
**transparence de la part du système** quant à son fonctionnement, aux situations dans
lesquelles il est susceptible d’échouer et à ce qu’il ne peut pas faire de manière
fiable. Une telle transparence est une condition nécessaire à une supervision humaine
effective; sans elle, les personnes responsables de l’exploitation ou de l’examen du
système ne peuvent pas exercer cette responsabilité efficacement.

Une évaluation rigoureuse des risques au stade de la gouvernance repose sur une
compréhension du fonctionnement du système, des situations dans lesquelles il est
susceptible d’échouer et des personnes susceptibles d’être touchées par ces défaillances.
Cette compréhension est limitée par l’opacité, qui varie considérablement selon la
manière dont le système a été obtenu. Pour les systèmes développés à l’interne, les
développeurs ont directement accès aux données d’entraînement, à l’architecture du modèle
et aux résultats d’évaluation, et la transparence relève largement de leur contrôle. Pour
les systèmes acquis, y compris la plupart des systèmes génératifs à usage général,
l’information nécessaire à l’évaluation des risques peut être partiellement ou totalement
inaccessible à l’organisation qui les déploie. Il en découle une distinction importante
entre les développeurs, qui contrôlent les propriétés fondamentales du système, et les
responsables du déploiement, qui sont chargés de son utilisation dans un contexte donné,
mais peuvent avoir une visibilité limitée sur son fonctionnement. Les deux parties
portent une responsabilité à l’égard des résultats du déploiement, mais les mesures
d’atténuation à leur disposition diffèrent considérablement, et le degré de prudence
appliqué au stade de la gouvernance devrait refléter cette réalité.

### Stratégies relatives aux données

La mesure d’atténuation la plus fondamentale des problèmes de représentation consiste à
utiliser des données d’entraînement vastes et inclusives qui reflètent la diversité des
personnes et des situations que le système rencontrera lors de son déploiement. Cela est
simple en principe, mais difficile en pratique. Les personnes diffèrent de nombreuses
façons importantes, et ces différences interagissent souvent : connaître des personnes
présentant l’attribut A et des personnes présentant l’attribut B ne suffit pas à
comprendre les personnes présentant les deux. Une couverture adéquate des cas
intersectionnels exige beaucoup plus de données qu’une couverture des attributs pris
isolément, et une couverture complète peut ne pas être réalisable. Lorsque ce n’est pas
possible, il ne faut pas considérer le système comme adéquat pour tous les cas, mais
plutôt documenter explicitement les limites de couverture et signaler les cas qui se
situent en dehors de ces limites, approche à laquelle nous revenons dans les sections
**Stratégies architecturales** et **Stratégies de suivi et d’amélioration**.

Pour les systèmes non supervisés spécifiques à une tâche, les lacunes de représentation
prennent une forme particulière. Plutôt que de produire des résultats incorrectement
classés, un groupe sous-représenté peut devenir invisible : trop petit ou trop diffus
pour former un groupe distinct significatif, il peut être absorbé dans un groupe dominant
auquel il ne correspond pas réellement, ou fragmenté en plusieurs groupes de manière à
masquer plutôt qu’à refléter ses caractéristiques. Le même principe de collecte de
données inclusives s’applique, mais l’évaluation est plus difficile, puisqu’il n’existe
pas d’étiquette de référence permettant de déterminer si le système a regroupé les
individus de manière appropriée.

Les moments où les choix liés aux données deviennent importants varient selon le type de
système. Pour les systèmes supervisés spécifiques à une tâche, les données d’entraînement
constituent le principal levier et sont en grande partie sous le contrôle des
développeurs. Pour les systèmes à usage général, les responsables du déploiement n’ont
généralement aucune influence sur les données d’entraînement; comme indiqué dans la
section Gouvernance, cette responsabilité incombe aux développeurs. Toutefois, quel que
soit le type de système, les responsables du déploiement conservent un contrôle
significatif sur d’autres données d’entrée, lesquelles doivent être gérées avec le même
soin que les données d’entraînement :

* _Données d’ajustement fin_ : Lorsqu’un système à usage général est adapté à un cas
  d’usage particulier par ajustement fin, les données utilisées doivent elles-mêmes être
  représentatives de la population que le système servira, y compris des groupes
  marginalisés. Un système dont les performances sont globalement bonnes peut fonctionner
  moins bien pour certains groupes si les données d’ajustement fin ne reflètent pas leur
  réalité.
* _Exemples en contexte_ : Pour les systèmes façonnés par apprentissage en contexte, les
  exemples inclus dans les invites constituent une forme de données d’entraînement et
  comportent les mêmes risques de représentation. Il convient de veiller à ce que les
  exemples en contexte n’excluent pas systématiquement certains groupes ni ne les
  représentent de manière erronée.
* _Corpus de récupération_ : Pour les systèmes qui consultent des sources de données
  externes, le contenu de ces sources constitue lui aussi une forme de données qui
  façonne le comportement du système. Ces corpus doivent être évalués en fonction de leur
  couverture et des risques de représentation erronée, puis mis à jour régulièrement afin
  de demeurer actuels.

Pour les systèmes discriminatifs à usage général, notamment les modèles de plongement
utilisés pour la recherche ou la classification, la qualité des représentations produites
dépend de l’étendue et de l’équilibre des données d’entraînement. Un modèle entraîné sur
des données qui sous-représentent certains groupes ou contextes produira des
représentations de moindre qualité pour les données provenant de ces groupes, avec des
répercussions sur toutes les tâches pour lesquelles le modèle est utilisé. Les
responsables du déploiement utilisant des modèles de plongement acquis devraient obtenir
des informations auprès des développeurs concernant la couverture des données
d’entraînement et évaluer les performances du modèle pour les groupes et contextes
pertinents dans leur cas d’usage.

Dans tous les cas, la représentation erronée est un enjeu aussi important que la
sous-représentation. Les données utilisées pour entraîner ou façonner le système peuvent
inclure des membres d’un groupe dans des proportions ou des contextes qui déforment
plutôt qu’ils ne reflètent la réalité, par exemple lorsque des données historiques
intègrent des schémas de discrimination passés. La sélection et la préparation des
données doivent donc porter non seulement sur la présence des groupes dans les données,
mais aussi sur la manière dont ils y sont représentés.

Les stratégies relatives aux données peuvent réduire les lacunes de représentation, mais
l’opacité limite notre capacité à vérifier qu’elles y parviennent réellement. Même avec
des données d’entraînement inclusives, il est difficile de confirmer qu’un modèle
complexe a appris à traiter adéquatement les groupes sous-représentés, car la relation
entre la composition des données d’entraînement et le comportement du modèle n’est pas
transparente. L’évaluation sur des ensembles de données de validation provenant de
groupes sous-représentés fournit des éléments probants, mais pas de certitude. Les
responsables du déploiement doivent donc considérer les stratégies relatives aux données
comme une condition nécessaire, mais non suffisante, à un traitement équitable des
groupes marginalisés.

### Stratégies architecturales

Les stratégies architecturales correspondent aux choix de conception concernant la
manière dont un système est construit et constituent l’un des leviers les plus directs
pour réduire les risques décrits dans la section précédente. Certaines de ces stratégies
sont accessibles tant aux développeurs qu’aux responsables du déploiement, tandis que
d’autres, notamment celles qui nécessitent un accès aux mécanismes internes du modèle,
relèvent principalement des développeurs. Comme indiqué dans la section Gouvernance, les
responsables du déploiement de systèmes acquis devraient chercher à obtenir des
informations auprès des développeurs sur les mesures d’atténuation architecturales mises
en place et documenter clairement les mesures supplémentaires qu’ils ont eux-mêmes mises
en œuvre.

#### Détection des cas hors distribution

Pour les systèmes supervisés spécifiques à une tâche, une mesure d’atténuation
architecturale utile consiste à ajouter une étape de traitement qui évalue la similarité
de chaque nouveau cas avec les exemples sur lesquels le système a été entraîné. Les cas
qui diffèrent sensiblement de ces exemples sont hors distribution, et le comportement du
système dans de tels cas est moins fiable. Détecter ces cas avant que le système ne
réponde permet de les orienter vers un traitement particulier, par exemple vers un
examinateur humain, plutôt que de les traiter comme s’ils relevaient pleinement des
compétences du système. Il existe diverses méthodes pour ce type d’évaluation, et le
choix approprié dépend de la nature des données et du système. L’exigence essentielle est
que la méthode soit validée sur les données spécifiques que le système rencontrera lors
de son déploiement, et non uniquement sur des ensembles de données de référence.

Cette mesure d’atténuation est directement liée aux stratégies relatives aux données
présentées ci-dessus : documenter les limites de couverture des données d’entraînement
constitue une condition préalable à l’identification des cas susceptibles d’être hors
distribution. Ensemble, ces deux stratégies constituent la base d’une approche fondée sur
des principes pour le traitement des cas inhabituels.

#### Garde-fous

Les garde-fous sont des mécanismes qui examinent les entrées d’un système ou ses sorties
et interviennent pour modifier ou encadrer la réponse du système. Ils s’appliquent à tous
les types de systèmes, bien que leur mise en œuvre diffère. Un garde-fou peut informer un
utilisateur que le système ne peut pas répondre de manière fiable à un certain type de
question; il peut signaler des entrées pour lesquelles la réponse du système est
susceptible d’être peu fiable; ou encore orienter ces entrées vers un traitement
alternatif plutôt que de les bloquer purement et simplement. Les garde-fous peuvent
également être utilisés pour détecter et signaler les cas hors distribution, en
complément de la stratégie de détection décrite ci-dessus.

Pour les systèmes génératifs à usage général, les garde-fous sont particulièrement
importants, car l’espace des entrées possibles est essentiellement illimité. Un garde-fou
ne peut pas anticiper tous les modes de défaillance, mais il peut être conçu pour
détecter des catégories connues d’entrées ou de sorties problématiques. Dans le cas des
systèmes fondés sur des GML, les garde-fous devraient idéalement comprendre des exemples
et contre-exemples explicites afin de définir clairement et de renforcer le comportement
attendu du système. Les responsables du déploiement conservent un contrôle significatif
sur les garde-fous, même lorsqu’ils ont un accès limité aux mécanismes internes du
modèle; leur mise en œuvre relève donc autant de leur responsabilité que de celle des
développeurs. Lorsque des garde-fous sont intégrés à un système acquis par son
développeur, les responsables du déploiement devraient chercher à comprendre ce qu’ils
couvrent et quelles sont leurs limites.

#### Contraintes de récupération

Pour les systèmes génératifs qui consultent des sources de données externes, les choix
architecturaux relatifs à la mise en œuvre de la récupération peuvent réduire à la fois
les problèmes d’hallucination et de perte de contexte. Lorsqu’il est possible de limiter
le système à des réponses fondées sur un contenu récupéré plutôt que générées librement,
le risque de fabrication est réduit. Une forme plus poussée de cette approche consiste à
mettre en œuvre la récupération sous forme de flux de données, dans lequel les réponses
proviennent directement d’une source fiable, une fois celle-ci identifiée par le système,
plutôt que d’être générées par le système lui-même. Cela n’élimine pas les erreurs de
récupération, mais supprime la capacité du système à fabriquer du contenu sans fondement
dans les données sources.

#### Complaisance de l’intelligence artificielle

La complaisance de l’intelligence artificielle, qui désigne la tendance d’un système à
adapter ses réponses à ce qu’un utilisateur semble vouloir plutôt qu’à ce qui est exact,
est traitée principalement au moyen de techniques d’alignement mises en œuvre par les
développeurs lors de l’entraînement et échappe en grande partie au contrôle des
responsables du déploiement. L’ajustement fin sur des exemples soigneusement sélectionnés
peut aider, mais il reste difficile de vérifier que ces ajustements réduisent de manière
fiable la complaisance de l’intelligence artificielle sans affecter d’autres aspects du
comportement du système. Les responsables du déploiement disposent ici de peu de moyens
d’action sur le plan architectural; la conception des invites offre certaines
possibilités d’atténuation et est abordée dans la section Stratégies de déploiement.

#### Sélection et remplaçabilité des modèles

Les problèmes décrits dans la section précédente, en particulier la fabrication et la
perte de contexte, varient considérablement selon les modèles, et les modèles plus
récents atténuent souvent des modes de défaillance connus. Les développeurs devraient
suivre les taux d’échec des tâches spécifiques prises en charge par leur système et
évaluer si des modèles alternatifs ou plus récents permettent de les réduire. Pour rendre
cela possible, les systèmes doivent être conçus de manière à ce que le modèle sous-jacent
puisse être remplacé sans nécessiter une refonte majeure. Cela implique d’éviter un
couplage étroit à l’API ou aux capacités d’un seul fournisseur, tant dans le code que
dans les ententes contractuelles. La sélection des modèles n’est pas une décision
ponctuelle, mais une démarche continue, et l’architecture doit en tenir compte.

#### Opacité

L’opacité limite la confiance que l’on peut accorder à l’ensemble des mesures
d’atténuation architecturales décrites ici. La détection des cas hors distribution peut
signaler des situations inhabituelles, mais ne permet pas de déterminer pleinement
pourquoi un système est susceptible d’y échouer. Les garde-fous peuvent détecter des
modes de défaillance connus, mais ne peuvent pas anticiper ceux qui ne sont pas encore
compris. Les contraintes de récupération réduisent la fabrication sans l’éliminer, et il
est difficile de vérifier qu’un système respecte effectivement ces contraintes en
pratique. Les responsables de la mise en œuvre devraient considérer les mesures
d’atténuation architecturales comme des mesures de réduction des risques plutôt que comme
des mesures d’élimination des risques.

### Stratégies de déploiement

Les stratégies de déploiement portent sur l’exploitation des systèmes d’intelligence
artificielle une fois en production. Contrairement aux stratégies présentées dans les
sections précédentes, les stratégies de déploiement relèvent presque entièrement des
responsables du déploiement et s’appliquent, que le système ait été développé à l’interne
ou acquis auprès d’un fournisseur.

#### Supervision humaine

Compte tenu des incertitudes liées aux systèmes d’intelligence artificielle, les
responsables du déploiement doivent assurer une supervision humaine effective de leur
fonctionnement. Cette mesure est particulièrement importante pour les situations
inhabituelles, qui, comme indiqué dans les sections précédentes, sont les plus
susceptibles d’être mal traitées. Lorsqu’un mécanisme de détection des cas hors
distribution est mis en place comme mesure architecturale, la pratique de déploiement
correspondante consiste à acheminer les cas signalés vers des évaluateurs humains. En
l’absence d’un tel mécanisme, les responsables du déploiement doivent établir d’autres
critères permettant d’identifier les situations nécessitant une évaluation humaine.

Une difficulté pratique se pose lorsqu’un système fonctionne correctement dans la
majorité des situations : l’attention portée à la supervision tend à diminuer lorsque les
erreurs sont rares. Pour maintenir cette vigilance, une approche consiste à introduire
périodiquement des cas synthétiques dont la réponse correcte est connue et pour lesquels
un type d’erreur précis est probable, sans que l’évaluateur sache qu’il s’agit de cas
synthétiques. Cela permet de vérifier si la supervision humaine est effectivement exercée
et d’intervenir lorsque l’attention diminue.

La supervision humaine n’est efficace que si elle est assurée par des personnes possédant
les connaissances nécessaires pour évaluer la pertinence d’une réponse, y compris dans
des situations inhabituelles. Confier cette responsabilité à des personnes ne disposant
pas de ces connaissances donne une impression de sécurité sans véritable fondement.

#### Rétroaction des utilisateurs et recours

Les personnes les plus concernées par le bon fonctionnement d’un système sont souvent
celles dont les situations y sont traitées. Les responsables du déploiement doivent donc
mettre en place des mécanismes accessibles permettant aux utilisateurs d’indiquer
lorsqu’ils estiment que leur situation n’a pas été traitée correctement par le système.
Lorsque des droits juridiques ou des intérêts importants sont en jeu, des procédures
efficaces de recours et de révision doivent être établies afin d’assurer une supervision
humaine effective des décisions contestées.

Les mécanismes de rétroaction doivent également prévoir un accès à une assistance
humaine, afin de permettre aux utilisateurs de contourner le système automatisé lorsque
leur situation n’a pas été traitée de manière satisfaisante. Il s’agit à la fois d’une
mesure d’équité et d’une mesure pratique : les utilisateurs qui ne peuvent obtenir une
assistance appropriée par l’intermédiaire d’un système automatisé ne se contenteront pas
d’une réponse inadéquate, et les coûts associés aux défaillances non résolues peuvent
être considérables.

#### Conception des invites

Pour les systèmes génératifs à usage général, la conception des invites constitue un
moyen d’action important sur le plan du déploiement pour atténuer plusieurs des problèmes
décrits dans la section précédente. Le fait d’intégrer explicitement, dans l’invite, des
éléments de contexte relatifs à la situation de l’utilisateur peut réduire les erreurs
liées à une perte de contexte, le système étant moins susceptible de répondre de manière
inappropriée lorsque les circonstances pertinentes sont précisées plutôt que supposées.
Varier délibérément la formulation d’une requête et comparer les réponses obtenues permet
également de mettre en évidence une instabilité : si des requêtes substantiellement
identiques donnent lieu à des réponses sensiblement différentes, la fiabilité du système
pour ce type de requête est remise en question. En ce qui concerne la complaisance de
l’intelligence artificielle, des instructions explicites dans l’invite demandant au
système de ne pas adapter sa réponse aux préférences perçues de l’utilisateur peuvent
atténuer ce phénomène, bien que la fiabilité de cette approche soit difficile à vérifier
et qu’elle ne doive pas être considérée comme une solution complète.

La conception des invites relève de la responsabilité des responsables du déploiement et
s’exerce généralement à deux niveaux distincts : les invites au niveau du système et la
conception destinée aux utilisateurs. Les invites système sont des instructions
invisibles, contrôlées par les développeurs, qui servent à établir des limites et à régir
le comportement de base. La conception destinée aux utilisateurs comprend des choix
architecturaux qui incitent les utilisateurs à formuler leurs requêtes plus efficacement,
par exemple au moyen de modèles d’entrée structurés ou en programmant le GML pour qu’il
pose des questions de clarification pendant une conversation. Bien que ces deux éléments
soient des moyens d’action essentiels au déploiement, leur efficacité est limitée par les
propriétés du modèle sous-jacent, que les responsables du déploiement ne contrôlent pas.
Les responsables du déploiement doivent donc considérer la conception des invites comme
un complément, et non comme un substitut, aux stratégies architecturales et aux
stratégies relatives aux données présentées dans les sections précédentes.

L’opacité pose un défi particulier pour la supervision humaine en contexte de
déploiement. Les personnes chargées d’examiner les résultats produits par un système
d’intelligence artificielle complexe ne peuvent généralement pas comprendre pourquoi le
système a produit une réponse donnée, ce qui limite leur capacité à en évaluer la
fiabilité ou à anticiper la manière dont il pourrait échouer dans des situations
similaires à l’avenir. Les mécanismes de rétroaction et les procédures de recours
permettent de constater qu’un problème est survenu, mais ne permettent généralement pas
d’en expliquer la cause. Les responsables du déploiement doivent informer clairement les
évaluateurs humains de cette limite et concevoir des processus de supervision qui ne
supposent pas que ces derniers puissent pleinement évaluer le raisonnement sous-jacent
aux résultats du système.

### Stratégies de suivi et d’amélioration

Les **tests** constituent une mesure d’atténuation essentielle, mais leur portée et leur
fiabilité diffèrent sensiblement de celles des tests appliqués aux logiciels classiques.
Pour ces derniers, l’ensemble des entrées valides est défini à l’avance et chaque entrée
correspond à une sortie correcte; les tests peuvent donc être menés de manière
systématique et leur couverture peut être mesurée.

Pour les systèmes supervisés spécifiques à une tâche, une situation comparable peut se
présenter dans des cas simples où les entrées sont contraintes à un format défini. Même
dans ces cas, il n’est toutefois pas toujours évident de déterminer la réponse correcte
pour une entrée présentant une combinaison inhabituelle de caractéristiques. Les tests
doivent examiner le comportement du système dans l’ensemble des situations qu’il
rencontrera dans le cadre du déploiement, en accordant une attention particulière aux
situations impliquant des groupes sous-représentés dans les données d’entraînement.

Pour les systèmes génératifs à usage général, la situation est nettement plus complexe.
La flexibilité qui rend ces systèmes utiles, notamment des entrées non contraintes et des
sorties ne devant pas prendre de forme particulière, rend également les tests
systématiques difficiles. Les tests peuvent accroître la confiance dans le fonctionnement
adéquat d’un système, mais ils ne peuvent offrir le degré de certitude que les tests de
logiciels classiques permettent souvent d’atteindre. En pratique, les tests automatisés
des systèmes génératifs reposent généralement sur d’autres systèmes génératifs pour
évaluer les sorties, ce qui introduit ses propres incertitudes.

Dans les deux cas, les tests doivent cibler en priorité les situations inhabituelles et
les cas limites, car ce sont les plus susceptibles d’être mal traités et les moins
susceptibles d’être détectés par des tests fondés sur des entrées typiques.

L’opacité accentue les limites des tests appliqués aux systèmes d’intelligence
artificielle. Même lorsqu’un système réussit une batterie de tests soigneusement conçue,
il n’est pas possible de comprendre pleinement pourquoi il se comporte comme il le fait,
ni d’avoir l’assurance que de bonnes performances dans les cas testés reflètent un
comportement fiable dans les cas non testés. Cela est particulièrement vrai pour les
situations inhabituelles impliquant des groupes marginalisés, pour lesquelles la
couverture des tests est la plus difficile à assurer et les conséquences d’une
défaillance les plus graves.

**Amélioration continue** : Lorsqu’un système produit des réponses incorrectes ou
inadéquates, les responsables du déploiement doivent avoir des processus en place pour y
réagir. Le mécanisme approprié dépend du type de système.

Pour les systèmes supervisés spécifiques à une tâche, l’approche principale consiste à
réentraîner le modèle. Cela implique d’intégrer des cas corrigés aux données
d’entraînement, puis de réentraîner le modèle, ou d’utiliser des techniques ciblées,
comme l’apprentissage actif, afin de prioriser l’annotation des cas situés dans des
régions de l’espace des entrées où le système fonctionne mal. Tout réentraînement doit
être suivi de tests pour vérifier que les performances s’améliorent pour les cas ciblés,
sans se dégrader ailleurs.

Pour les systèmes génératifs à usage général, le réentraînement n’est généralement pas
accessible aux responsables du déploiement. Deux solutions de rechange pratiques
existent. D’abord, si le système dispose de capacités de récupération, il est possible de
lui fournir une base de données de cas passés et de leur traitement approprié, afin qu’il
puisse s’y référer pour traiter de nouveaux cas similaires. Ensuite, des cas corrigés
accompagnés de leurs réponses appropriées peuvent être intégrés aux invites, en tirant
parti de la capacité des systèmes génératifs modernes à apprendre à partir d’exemples en
contexte. Ces deux approches nécessitent un suivi afin de vérifier qu’elles produisent
l’effet recherché, puisqu’aucune ne garantit que le système généralisera correctement à
partir des éléments ajoutés.

Quel que soit le type de système, les processus d’amélioration doivent eux-mêmes faire
l’objet d’une supervision. Des corrections qui semblent efficaces lors des tests peuvent
ne pas se généraliser de manière fiable à de nouveaux cas. De plus, des modifications
visant à améliorer les performances dans un domaine peuvent entraîner des effets
inattendus ailleurs. L’opacité des systèmes d’intelligence artificielle complexes
signifie qu’il est rarement possible de vérifier avec certitude qu’une amélioration
fonctionne; il est seulement possible d’en accroître la probabilité au moyen de tests et
d’un suivi rigoureux.

## Conclusion

Les systèmes d’intelligence artificielle offrent un réel potentiel pour améliorer la
qualité et la cohérence des décisions et des services, dans les limites des contraintes
de ressources auxquelles les responsables de la mise en œuvre, du développement et du
déploiement sont inévitablement confrontés. Toutefois, ce potentiel s’accompagne de
risques que la présente spécification cherche à rendre concrets : des systèmes qui
fonctionnent bien en moyenne peuvent fonctionner moins bien pour les personnes dont les
situations sont inhabituelles, alors même que ce sont souvent celles qui ont le plus
besoin d’un traitement fiable et équitable.

Les mesures d’atténuation décrites dans la présente spécification n’éliminent pas ces
risques. Les stratégies relatives aux données peuvent réduire les lacunes de
représentation, sans pouvoir les combler entièrement. Les stratégies architecturales et
de déploiement peuvent permettre de détecter et de rediriger les cas inhabituels, mais
elles reposent sur une opacité au moins partiellement compensée par la transparence. Les
mécanismes de suivi et d’amélioration peuvent corriger des défaillances connues, sans
garantir que ces corrections se généraliseront. Enfin, la gouvernance permet d’encadrer
de manière réfléchie les décisions concernant le déploiement de l’intelligence
artificielle et ses modalités d’utilisation, mais ne remplace pas une vigilance soutenue
une fois les systèmes en opération.

La présente spécification fournit toutefois un cadre structuré pour exercer cette
vigilance : elle propose une façon de se demander, à chaque étape du développement et du
déploiement, si les risques pour les personnes en marge ont été pris au sérieux et si les
mesures d’atténuation disponibles ont été mises en œuvre. Cela ne garantit pas l’équité,
mais en constitue une condition nécessaire.

## Remerciements

Nous remercions sincèrement les personnes suivantes ayant participé à ce projet.

* Prithy Ahmed, Conseil canadien des normes
* Clayton H. Lewis, University of Colorado Boulder (coresponsable du groupe de rédaction)
* Cindy Li, OCAD University
* Justin Obara, OCAD University
* Vera Roberts, OCAD University
* David Rokeby, University of Toronto
* Joseph Scheuhammer, OCAD University
* Julia Stoyanovich, New York University
* Jutta Treviranus, OCAD University
* Jason J.G. White, participant à titre individuel (coresponsable du groupe de rédaction)

## Droit d’auteur et licence

La présente publication est protégée par le droit d’auteur © 2026 OCAD University et est
distribuée selon les modalités de la [Creative Commons Attribution – Partage dans les mêmes conditions 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/deed.fr).
