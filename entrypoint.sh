#!/bin/bash
# Docker entrypoint script.

# Create, migrate, and seed database if it doesn't exist.

/app/bin/${APP_NAME} eval "MeetYourTutor.Release.migrate"

/app/bin/${APP_NAME} eval "MeetYourTutor.ReleaseTasks.seed"

/app/bin/${APP_NAME} start

