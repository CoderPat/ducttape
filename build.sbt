scalaVersion := "2.12.13";

libraryDependencies += "commons-io" % "commons-io" % "2.4";
libraryDependencies += "com.frugalmechanic" %% "scala-optparse" % "1.1.3";
libraryDependencies += "javax.servlet" % "javax.servlet-api" % "3.0.1" % "provided";
libraryDependencies += "org.slf4j" % "slf4j-api" % "1.7.36";
libraryDependencies += "org.slf4j" % "slf4j-simple" % "1.7.36";
libraryDependencies += "org.clapper" %% "grizzled-slf4j" % "1.3.0";
libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "2.0.0";
libraryDependencies += "org.pegdown" % "pegdown" % "1.1.0";
libraryDependencies += "org.parboiled" % "parboiled-java" % "1.3.1";
libraryDependencies += "org.xerial" % "sqlite-jdbc" % "3.8.11.2";
libraryDependencies += "org.apache.commons" % "commons-lang3" % "3.12.0";
libraryDependencies += "org.eclipse.jetty" % "jetty-server" % "8.2.0.v20160908";
libraryDependencies += "org.eclipse.jetty" % "jetty-servlet" % "8.2.0.v20160908";
libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.1" % Test;
libraryDependencies += "junit" % "junit" % "4.10" % Test;

assembly / assemblyJarName := "ducttape.jar"

assemblyMergeStrategy in assembly := {
 case PathList("META-INF", xs @ _*) => MergeStrategy.discard
 case x => MergeStrategy.first
}

