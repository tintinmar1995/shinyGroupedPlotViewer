# shinyGroupedPlotViewer

Une application Shiny pour la visualisation de séries de graphiques exportés.

## Exemple

Supposons que vous avez trois graphiques (chart1, chart2, chart3) pour une série de villes.

### Structure des fichiers dans le répertoire :

```
paris_chart1.png
paris_chart2.png
paris_chart3.png
lyon_chart1.png
lyon_chart2.png
lyon_chart3.png
rennes_chart1.png
rennes_chart2.png
rennes_chart3.png
```

### Fonctionnalité

Grâce à une expression régulière (REGEX), l'application propose un champ de sélection pour choisir la ville à afficher. Une fois la ville sélectionnée, l'application affiche les graphiques `chart1`, `chart2` et `chart3` uniquement pour la ville choisie.

## Utilisation

1. **Préparation des fichiers** : Assurez-vous que vos fichiers de graphiques suivent une nomenclature cohérente ou qu'il est possible de capter les différences de nomenclature grâce à une expression régulière (REGEX). Par exemple, les fichiers peuvent suivre la nomenclature `ville_chartX.png`, où `ville` est le nom de la ville et `X` est le numéro du graphique.

2. **Configuration** :
   - **Chemin vers les graphiques** : Vous pouvez configurer le chemin vers le répertoire contenant les graphiques.
   - **Expression régulière (REGEX)** : Vous pouvez configurer l'expression régulière utilisée pour extraire les informations des noms de fichiers.

3. **Lancement de l'application** : Démarrez l'application Shiny.

4. **Sélection de la ville** : Utilisez le champ de sélection pour choisir la ville dont vous souhaitez visualiser les graphiques.

5. **Visualisation** : Les graphiques correspondants à la ville sélectionnée seront affichés.

## Installation

Pour utiliser `shinyGroupedPlotViewer`, vous devez avoir R et le package Shiny installés. Vous pouvez installer Shiny en utilisant la commande suivante :

```R
install.packages("shiny")
```

Ensuite, clonez ce dépôt et lancez l'application Shiny en exécutant le fichier `app.R` ou en utilisant la commande suivante dans R :

```R
shiny::runApp("path/to/shinyGroupedPlotViewer")
```

## Contribution

Les contributions sont les bienvenues ! Si vous avez des suggestions, des améliorations ou des corrections, n'hésitez pas à ouvrir une issue ou à soumettre une pull request.

## Licence

Ce projet est libre de droit. Vous pouvez l'utiliser, le modifier et le distribuer librement sans aucune restriction.
