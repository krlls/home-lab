/*jshint esversion: 7 */

const components = require('../config/components.json').components

function printProjectNames(componentsList) {
  console.log('Components:', "\x1b[32m", componentsList.map((p) => p.name).join(', '),'\x1b[0m')
}

printProjectNames(components)