#!/bin/bash

scp /home/gitlab-runner/builds/zM-m23RV/0/students/DO6_CICD.ID_356283/daariopa_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat daariopa@192.168.0.103:/usr/local/bin/

scp /home/gitlab-runner/builds/zM-m23RV/0/students/DO6_CICD.ID_356283/daariopa_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep daariopa@192.168.0.103:/usr/local/bin

ssh daariopa@192.168.0.103 ls /usr/local/bin
