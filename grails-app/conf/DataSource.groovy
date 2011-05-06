import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsAnnotationConfiguration

dataSource {
	configClass = GrailsAnnotationConfiguration.class
	pooled = false
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password =  "root"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}

hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
	cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/CenterCarService"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/CenterCarService"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/CenterCarService"
		}
	}
}