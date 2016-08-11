#!/usr/bin/env groovy
def runme
node('knife-wks') {
    checkout scm
    sh 'git submodule update --init'
    runme = load '.jenkins/Jenkinsfile'
    runme.go()
}
