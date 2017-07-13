package com.springportfolio.support;

import org.flywaydb.core.Flyway;

public class FlywayMigration {
	private FlywayMigration(){
		
	}
	
	public static void clean(){
		Flyway flyway = new Flyway();
		flyway.setDataSource("jdbc:h2:~/Spring-portfolio", "sa", "");
		flyway.clean();
	}
	public static void migrate(){
		Flyway flyway = new Flyway();
		flyway.setDataSource("jdbc:h2:~/Spring-portfolio", "sa", "");
		flyway.migrate();
	}
}
