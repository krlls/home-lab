/*jshint esversion: 7 */

const projects = require('../config/components.json').projects
const exec = require('child_process').exec

function stopProject(projectsList) {
  const project = projectsList.find((p) => p.name === process.argv[2])
  const projectNames = projectsList.map((p) => p.name).join(', ')

  if (!project) {

    console.error("\x1b[31m", 'ERROR: Select project name: `make component.stop component=<name>`', '\x1b[0m')
    console.log('\x1b[33m', 'Names:', projectNames, '\x1b[0m')
    return
  }

  console.log("\x1b[31m", '== PROJECT STOP ==','\x1b[0m')
  console.log('Projects:', "\x1b[32m", project.name,'\x1b[0m')

  const cmpStr = ` -f ./projects/${project.file}`

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

stopProject(projects)