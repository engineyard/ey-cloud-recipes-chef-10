Engine Yard Cloud Recipes
===============

Installation
============

Follow these steps to use custom deployment recipes with your applications.

1. Install the engineyard gem:
  $ gem install engineyard
2. Add any custom recipes or tweaks to your copy of these recipes.
3. Upload them with: `ey recipes upload -e ENV`, where ENV is the name of your
  environment in Engine Yard Cloud. This may be different than your Rails or PHP
  environment name.
4. Once you have completed these steps, each rebuild will run the your
  recipes after the default Engine Yard recipes have run. When you
  update your recipes, just re-run `ey recipes upload -e ENV`.