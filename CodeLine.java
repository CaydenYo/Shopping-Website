import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class CodeLine {
	public static void main(String[] args) {
		File file=new File("src");
		int sum=calcCodeLine(file);
		System.out.println("sum="+sum);
	}	
	public static int calcCodeLine(File file){
		int sum=0;
		if(file.isDirectory()){//是文件夹
			for(File file2:file.listFiles()){
				sum+=calcCodeLine(file2);
			}
		}else{//是文件
			FileReader fr=null;
			BufferedReader br=null;
			try {
				fr=new FileReader(file);
				br=new BufferedReader(fr);
				String str=null;
				while((str=br.readLine())!=null){
					if(str.startsWith("package")) continue;//package行不统计
					if(str.startsWith("import")) continue;//导包行不统计
					if(str.trim().length()==0)continue;//空行不统计
					sum++;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(br!=null){
					try {
						br.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if(fr!=null){
					try {
						fr.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return sum;
	}
}
