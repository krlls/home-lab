/*jshint esversion: 7 */

const components = require('../config/components.json').components
const exec = require('child_process').exec

function startProjects(componentsList) {
  console.log("\x1b[35m", '== COMPONENTS START ==','\x1b[0m')
  console.log('Components:', componentsList.map((p) => p.disabled ? `\x1b[31mDISABLED: ${p.name}\x1b[0m` : `\x1b[32m${p.name}\x1b[0m`).join(', '))
  const cmpStr = componentsList.reduce((previousValue, { file, disabled }) => {
    if (disabled) {
      return previousValue
    }

    return previousValue + ` -f ./components/${file}`
  }, '')

  const cmd = `docker compose${cmpStr} --env-file ./config/.env up -d`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err?.message)
    }

    if (stdout) {
      console.log(stdout)
    }

    if (!err) {
      console.log("\x1b[35m", '== START SUCCESS ==','\x1b[0m')
    }
  })
}

startProjects(components)
