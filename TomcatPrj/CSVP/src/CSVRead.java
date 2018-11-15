import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class CSVRead {
	
	public static void main(String[] args) {
		try (BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\shin\\Downloads\\score.csv"))) {
			String line;
			while ((line = br.readLine()) != null) {
				String[] ls = line.split(",");
				for (String s : ls) {
					System.out.print(s + "\t\t");
				}
				System.out.println();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
