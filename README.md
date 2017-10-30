# Containers et configuration: de la promesse au concret avec git et confd

Docker (et le principe des conteneurs en général) est fortement lié à la promesse d'une image unique qui peut tourner partout et que le même artefact peut être utilisé sur n'importe quel environnement "runtime" (du poste de développement jusqu'en production !) sans avoir à reconstruire une image à chaque fois.

Mais comment atteindre cet objectif de manière pratique et efficace tout en étant capable de conserver l'historique de la configuration de vos applications sur les différents environnements ?

Cette présentation vous propose de voir comment les outils `git` et `confd` peuvent vous aider dans cette mission critique sans perdre la flexibilité nécessaire pour que vos devs et vos ops puissent cohabiter sereinement.
