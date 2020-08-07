job("job1"){
   description("This job will pull the GitHub repo")

scm{
github("Nupur521/task6","master")
}

triggers{
scm("* * * * *")
upstream("seed_job",'SUCCESS')
}

steps{
shell(readFileFromWorkspace('job1.sh'))

}
}


job("job2"){

triggers{
upstream('job1','SUCCESS')
}

steps{
shell(readFileFromWorkspace('job2.sh'))

}
}


job("job3"){

triggers{
upstream('job2','SUCCESS')
}

steps{
shell(readFileFromWorkspace('job3.sh'))
}
}

job("job4"){
triggers{
upstream('job3','SUCCESS')
}

publishers {
extendedEmail {
recipientList('nupuragarwal521@gmail.com')
defaultSubject("Information regarding your server")
defaultContent("Please Check your webserver. It is a message from Jenkins and your webserver is not in the running state")
contentType('text/plain')
triggers {
beforeBuild()
stillUnstable {
subject('Subject')
content('Body')
sendTo {
developers()
requester()
culprits()
	       }
        }
      }
    }
   }
 }


buildPipelineView('Task6') {
filterBuildQueue()
filterExecutors()
title('TASK-6')
displayedBuilds(1)
selectedJob('job1')
alwaysAllowManualTrigger()
showPipelineParameters()
refreshFrequency(60)
}




