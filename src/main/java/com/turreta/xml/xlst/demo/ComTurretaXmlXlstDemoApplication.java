package com.turreta.xml.xlst.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

@SpringBootApplication
public class ComTurretaXmlXlstDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ComTurretaXmlXlstDemoApplication.class, args);

		ClassLoader classLoader = ComTurretaXmlXlstDemoApplication.class.getClassLoader();

		Source inputXml = new StreamSource(classLoader.getResource("input.xml").getFile());
		Source xsl = new StreamSource(classLoader.getResource("transformation.xsl").getFile());
		Result outputXml = new StreamResult(
				new File("C:\\Users\\abc\\Desktop\\test-data\\2\\output.xml"));

		try {
			Transformer transformer = TransformerFactory.newInstance().newTransformer(xsl);
			transformer.setParameter("removeCompany", true);
			transformer.transform(inputXml, outputXml);
		} catch (TransformerException e) {
			e.getMessage();
		}
	}
}
