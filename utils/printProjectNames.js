/*jshint esversion: 7 */

const projects = require('../components.json').projects

function printProjectNames(projectsList) {
  console.log('Projects:', "\x1b[32m", ...projectsList.map((p) => p.name),'\x1b[0m')
}

printProjectNames(projects)