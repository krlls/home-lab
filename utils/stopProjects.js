/*jshint esversion: 7 */

const components = require('../config/components.json').components
const exec = require('child_process').exec

function startProjects(componentsList) {
  console.log("\x1b[31m", '== COMPONENTS STOP ==','\x1b[0m')
  console.log('Components:', "\x1b[32m", componentsList.map((p) => p.name).join(', '),'\x1b[0m')
  const cmpStr = componentsList.reduce((previousValue, { file, permanently }) => {
    if (permanently) {
      return previousValue
    }

    return previousValue + ` -f ./components/${file}`
  }, '')

  const cmd = `docker-compose${cmpStr} down`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err?.message)
    }

    if (stdout) {
      console.log(stdout)
    }

    if (!err) {
      console.log("\x1b[31m", '== STOP SUCCESS ==','\x1b[0m')
    }
  })
}

startProjects(components)