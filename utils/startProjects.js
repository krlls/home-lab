/*jshint esversion: 7 */

const projectsList = require('../components.json').projects
const exec = require('child_process').exec

function startProjects(projectsList) {
  const cmpStr = projectsList.reduce((previousValue, { file }) => {
    return previousValue + ` -f ./projects/${file}`
  }, '')

  const cmd = `docker-compose${cmpStr} --env-file ./config/.env up -d`

  exec(cmd, (err, stdout) => {
    if (err) {
      console.log(err)
    }

    console.log(stdout)
  })
}

startProjects(projectsList)