/*jshint esversion: 7 */

const components = require('../config/components.json').components
const exec = require('child_process').exec

function pullProject(componentsList) {
  const project = componentsList.find((p) => p.name === process.argv[2])
  const projectNames = componentsList.map((p) => p.name).join(', ')

  if (!project) {
    console.error("\x1b[31m", 'ERROR: Select Components name', '\x1b[0m')
    console.log('\x1b[33m', 'Names:', projectNames, '\x1b[0m')
    return
  }

  console.log("\x1b[33m", '== COMPONENT PULL ==','\x1b[0m')
  console.log('Components:', "\x1b[32m", project.name,'\x1b[0m')

  const cmpStr = ` -f ./components/${project.file}`

  const cmd = `docker compose${cmpStr} pull`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err?.message)
    }

    if (stdout) {
      console.log(stdout)
    }

    if (!err) {
      console.log("\x1b[33m", '== PULL SUCCESS ==','\x1b[0m')
    }
  })
}

pullProject(components)
