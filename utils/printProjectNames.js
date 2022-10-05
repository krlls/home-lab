/*jshint esversion: 7 */

const components = require('../config/components.json').components

function printProjectNames(componentsList) {
  console.log('Components:', componentsList.map((p) => p.disabled ? `\x1b[31mDISABLED: ${p.name}\x1b[0m` : `\x1b[32m${p.name}\x1b[0m`).join(', '))
}

printProjectNames(components)