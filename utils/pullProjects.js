/*jshint esversion: 7 */

const projectsList = require('../components.json').projects
const exec = require('child_process').exec

function pullProjects(projectsList) {
  const cmpStr = projectsList.reduce((previousValue, { file }) => {
    return previousValue + ` -f ./projects/${file}`
  }, '')

  const cmd = `docker-compose${cmpStr} pull`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err)
    }

    console.log(stdout)
  })
}

pullProjects(projectsList)