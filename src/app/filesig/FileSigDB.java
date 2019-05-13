/**
 * Purpose: Simply read in a file of csv file signature NSLRFile records and write them to a db (as json or) sql. 
 */
package app.filesig;

import java.io.File;
import java.util.Collection;

/**
 * @author a
 *
 */
public class FileSigDB {

    private static final String FOLDER = "/home/abc/share";

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		FileAction fa = new FileAction();
		Collection<File> fileCollection = fa.listFiles(FOLDER);

		for (File f : fileCollection)
			fa.readCSVFile(f.getPath());
	}

}
