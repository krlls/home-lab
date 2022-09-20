/*jshint esversion: 7 */

const projects = require('../components.json').projects
const exec = require('child_process').exec

function startProjects(projectsList) {
  console.log("\x1b[31m", '== PROJECTS STOP ==','\x1b[0m')
  console.log('Projects:', "\x1b[32m", ...projectsList.map((p) => p.name),'\x1b[0m')
  const cmpStr = projectsList.reduce((previousValue, { file }) => {
    return previousValue + ` -f ./projects/${file}`
  }, '')

  const cmd = `docker-compose${cmpStr} down`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err?.message)
    }

    console.log(stdout)

    if (!err) {
      console.log("\x1b[31m", '== START SUCCESS ==','\x1b[0m')
    }
  })
}

startProjects(projects)