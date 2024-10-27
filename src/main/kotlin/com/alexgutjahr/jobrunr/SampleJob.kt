package com.alexgutjahr.jobrunr

import org.jobrunr.jobs.annotations.Job
import org.jobrunr.jobs.annotations.Recurring
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component

@Component
class SampleJob {

    companion object {
        private val log = LoggerFactory.getLogger(SampleJob::class.java)
    }

    @Job(name = "Sample Job")
    @Recurring(id = "sample-job", cron = "0 5 2 * * *", zoneId = "Europe/Berlin")
    fun execute() {
        log.info("Executing..")
    }

}