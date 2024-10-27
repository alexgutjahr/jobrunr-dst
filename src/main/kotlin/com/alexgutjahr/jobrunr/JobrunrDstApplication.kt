package com.alexgutjahr.jobrunr

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class JobrunrDstApplication

fun main(args: Array<String>) {
    runApplication<JobrunrDstApplication>(*args)
}
