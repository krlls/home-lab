/*jshint esversion: 7 */

const components = require('../config/components.json').components
const exec = require('child_process').exec

function startProjects(componentsList) {
  console.log("\x1b[35m", '== COMPONENTS START ==','\x1b[0m')
  console.log('Components:', "\x1b[32m", componentsList.map((p) => p.name).join(', '),'\x1b[0m')
  const cmpStr = componentsList.reduce((previousValue, { file }) => {
    return previousValue + ` -f ./components/${file}`
  }, '')

  console.log(cmpStr)
}

startProjects(components)