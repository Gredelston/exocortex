#!/usr/bin/env python3

import mysql.connector

def new_connection(config) -> mysql.connector.connection_cext.CMySQLConnection:
    ip = config.get(config.MYSQL_IP)
    user = config.get(config.MYSQL_USER)
    password = config.get(config.MYSQL_PASSWORD)
    return mysql.connector.connect(user=user, password=password, host=ip)
