/*jshint esversion: 7 */

const projects = require('../components.json').projects
const exec = require('child_process').exec

function pullProject(projectsList) {
  const project = projectsList.find((p) => p.name === process.argv[2])
  const projectNames = projectsList.map((p) => p.name)

  if (!project) {
    console.error("\x1b[31m", 'ERROR: Select project name', '\x1b[0m')
    console.log('\x1b[33m', 'Names:', projectNames.join(', '), '\x1b[0m')
    return
  }

  console.log("\x1b[33m", '== PROJECT PULL ==','\x1b[0m')
  console.log('Projects:', "\x1b[32m", project.name,'\x1b[0m')

  const cmpStr = ` -f ./projects/${project.file}`

  const cmd = `docker-compose${cmpStr} pull`

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

pullProject(projects)