/*jshint esversion: 7 */

const projectsList = require('../components.json').projects
const exec = require('child_process').exec

function stopProjects(projectsList) {
  const cmpStr = projectsList.reduce((previousValue, { file }) => {
    return previousValue + ` -f ./projects/${file}`
  }, '')

  const cmd = `docker-compose${cmpStr} down`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err)
    }

    console.log(stdout)
  })
}

stopProjects(projectsList)