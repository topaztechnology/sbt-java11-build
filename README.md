# Scala base build image

## Supported tags and respective `Dockerfile` links
`latest` [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/master/Dockerfile) - the latest release

|   Tag    | Ubuntu  | OpenJDK  |   Scala   |   SBT    | Dockerfile |
|----------|---------|----------|-----------|----------|------------|
| `11.0.6` | `18.04` | `11.0.6` |    n/a    |   n/a    | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.6/Dockerfile) |
| `11.0.7` | `20.04` | `11.0.7` | `2.12.11` | `1.3.12` | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.7/Dockerfile) |

## Overview

A simple base image to be used in multistage Docker builds for Scala projects, including OpenJDK 11 and sbt. The build also caches specific versions of Scala & SBT to improve image build time.
