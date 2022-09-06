# Testing

## Stack

We're currently using **Vitest** with **vue-test-utils** and **c8** for coverage. We're using this [config file](/vitest.config.ts) to determine wich paths should be included or excluded in the coverage process, as well as which plugins to use.

## Limitations

Due to the auto-import funcionality provided by NUXT, we're currently unable to properly test our components, since it doesn't seems to be a way of actually refencing child components when mounting the parent component.

I'm guessing this should be adressed soon by the NUXT team, so for now, we're only gonna be testing the **composables** folder.
