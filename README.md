# Scala base build image

## Supported tags and respective `Dockerfile` links
`latest` [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/master/Dockerfile) - the latest release

|   Tag         | Ubuntu  | OpenJDK   | Scala 2.12 | Scala 2.13 |  SBT     | Dockerfile |
|---------------|---------|-----------|------------|------------|----------|------------|
| `11.0.6`      | `18.04` | `11.0.6`  |    n/a     |    n/a     |   n/a    | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.6/Dockerfile) |
| `11.0.7`      | `20.04` | `11.0.7`  | `2.12.11`  |    n/a     | `1.3.12` | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.7/Dockerfile) |
| `11.0.8`      | `20.04` | `11.0.8`  | `2.12.12`  |    n/a     | `1.3.13` | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.8/Dockerfile) |
| `11.0.8-2.13` | `20.04` | `11.0.8`  |    n/a     | `2.13.3`   | `1.3.13` | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.8-2.13/Dockerfile) |
| `11.0.9`      | `20.04` | `11.0.9`  | `2.12.12`  | `2.13.3`   | `1.4.1`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.9/Dockerfile) |
| `11.0.10`     | `20.04` | `11.0.10` | `2.12.12`  | `2.13.3`   | `1.4.9`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.10/Dockerfile) |
| `11.0.10_1`   | `20.04` | `11.0.10` | `2.12.13`  | `2.13.5`   | `1.5.0`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.10_1/Dockerfile) |
| `11.0.11`     | `20.04` | `11.0.11` | `2.12.13`  | `2.13.5`   | `1.5.2`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.11/Dockerfile) |
| `11.0.13`     | `20.04` | `11.0.13` |    n/a     | `2.13.5`   | `1.5.6`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.13/Dockerfile) |
| `11.0.13_1    | `20.04` | `11.0.13` |    n/a     | `2.13.8`   | `1.6.2`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.13_1/Dockerfile) |
| `11.0.15      | `20.04` | `11.0.15` |    n/a     | `2.13.8`   | `1.6.2`  | [(Dockerfile)](https://github.com/topaztechnology/sbt-java11-build/blob/11.0.15/Dockerfile) |

## Overview

A simple base image to be used in multistage Docker builds for Scala projects, including OpenJDK 11 and sbt. The build also caches specific versions of Scala & SBT to improve image build time.
