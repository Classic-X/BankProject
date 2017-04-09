

import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class GenPDF
 */

public class GenPDF  {

	public static String FILE="Account_Opening_Form.pdf";
	public static void generate(String details[]) throws ServletException, IOException {
		
		try
		{
			
			
			if(details[11]=="")
				details[11]="                 -";
			
	 
			
			Document doc=new Document();
			PdfWriter writer=PdfWriter.getInstance(doc, new FileOutputStream(FILE));
			doc.open();
			doc.setPageSize(PageSize.A4);
			doc.addTitle("Personal Details");
			 PdfContentByte canvas = writer.getDirectContent();
		      Rectangle rect = new Rectangle(36, 36, 559, 806);
		        rect.setBorder(Rectangle.BOX);
		        rect.setBorderWidth(1);
		        canvas.rectangle(rect);
		        
		        
			Font font = new Font(Font.FontFamily.TIMES_ROMAN, 15,  Font.UNDERLINE | Font.BOLD);
			Font font2 = new Font(Font.FontFamily.HELVETICA, 20, Font.ITALIC| Font.UNDERLINE | Font.BOLD);
			Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 10);
			Font font4 = new Font(Font.FontFamily.TIMES_ROMAN, 8);
			Paragraph p0=new Paragraph("Friendly Bank",font2);
			Paragraph p=new Paragraph("Application Form",font);
			p0.setAlignment(Element.ALIGN_CENTER);
			p0.setSpacingAfter(10);
			p0.setSpacingBefore(0);
			p.setAlignment(Element.ALIGN_CENTER);
			p.setSpacingAfter(3);
			
			doc.add(p0);
			doc.add(p);
			
			Paragraph p5=new Paragraph("(To be submitted at the nearest branch along with copy of ID proof and Address proof)",font4);
			p5.setAlignment(Element.ALIGN_CENTER);
			p5.setSpacingAfter(20);
			doc.add(p5);
			
			
			Paragraph p4=new Paragraph("(Applicant's Photo)                                                          ",font4);
			p4.setSpacingAfter(3);
			p4.setAlignment(Element.ALIGN_RIGHT);
			doc.add(p4);
			
			PdfPTable table = new PdfPTable(2);
			float[] columnWidths = {4f,2f};
	        table.setWidths(columnWidths);
			PdfPTable intable=new PdfPTable(2);
			float[] columnWidths1 = {1f,2f};
	        intable.setWidths(columnWidths1);
			
	        PdfPCell in11=new PdfPCell(new Paragraph("1.Name:",font3));
			in11.setBorderColor(BaseColor.WHITE);
			PdfPCell in12=new PdfPCell(new Paragraph(details[0]+" "+details[1]+" "+details[2]+" "+details[3],font3));
			in12.setBorderColor(BaseColor.WHITE);
			in11.setMinimumHeight(20f);
			in12.setMinimumHeight(20f);
			intable.addCell(in11);
			intable.addCell(in12);
			
			PdfPCell in21=new PdfPCell(new Paragraph("2.Date of Birth:",font3));
			PdfPCell in22=new PdfPCell(new Paragraph(details[7],font3));
			in21.setBorderColor(BaseColor.WHITE);
			in22.setBorderColor(BaseColor.WHITE);
			in21.setMinimumHeight(20f);
			in22.setMinimumHeight(20f);
			intable.addCell(in21);
			intable.addCell(in22);
			
			PdfPCell in31=new PdfPCell(new Paragraph("3.Gender:",font3));
			PdfPCell in32=new PdfPCell(new Paragraph(details[4],font3));
			in31.setBorderColor(BaseColor.WHITE);
			in32.setBorderColor(BaseColor.WHITE);
			in31.setMinimumHeight(20f);
			in32.setMinimumHeight(20f);
			intable.addCell(in31);
			intable.addCell(in32);
			
			PdfPCell in41=new PdfPCell(new Paragraph("4.Name of Mother:",font3));
			PdfPCell in42=new PdfPCell(new Paragraph(details[9],font3));
			in41.setBorderColor(BaseColor.WHITE);
			in42.setBorderColor(BaseColor.WHITE);
			in41.setMinimumHeight(20f);
			in42.setMinimumHeight(20f);
			intable.addCell(in41);
			intable.addCell(in42);
			
			PdfPCell in51=new PdfPCell(new Paragraph("5.Name of Father:",font3));
			PdfPCell in52=new PdfPCell(new Paragraph(details[10],font3));
			in51.setBorderColor(BaseColor.WHITE);
			in52.setBorderColor(BaseColor.WHITE);
			in51.setMinimumHeight(20f);
			in52.setMinimumHeight(20f);
			intable.addCell(in51);
			intable.addCell(in52);
			
			PdfPCell in61=new PdfPCell(new Paragraph("6.Name of Guardian(In case of minors):",font3));
			PdfPCell in62=new PdfPCell(new Paragraph(details[11],font3));
			in61.setBorderColor(BaseColor.WHITE);
			in62.setBorderColor(BaseColor.WHITE);
			in61.setMinimumHeight(20f);
			in62.setMinimumHeight(20f);
			intable.addCell(in61);
			intable.addCell(in62);
			
			PdfPCell in71=new PdfPCell(new Paragraph("7.Email ID:",font3));
			PdfPCell in72=new PdfPCell(new Paragraph(details[5],font3));
			in71.setBorderColor(BaseColor.WHITE);
			in72.setBorderColor(BaseColor.WHITE);
			in71.setMinimumHeight(20f);
			in72.setMinimumHeight(20f);
			intable.addCell(in71);
			intable.addCell(in72);
			
			PdfPCell in81=new PdfPCell(new Paragraph("8.Mobile No.:",font3));
			PdfPCell in82=new PdfPCell(new Paragraph(details[6],font3));
			in81.setBorderColor(BaseColor.WHITE);
			in82.setBorderColor(BaseColor.WHITE);
			in81.setMinimumHeight(20f);
			in82.setMinimumHeight(20f);
			intable.addCell(in81);
			intable.addCell(in82);
			
			PdfPCell in91=new PdfPCell(new Paragraph("9.Education:",font3));
			PdfPCell in92=new PdfPCell(new Paragraph(details[8],font3));
			in91.setBorderColor(BaseColor.WHITE);
			in92.setBorderColor(BaseColor.WHITE);
			in91.setMinimumHeight(20f);
			in92.setMinimumHeight(20f);
			intable.addCell(in91);
			intable.addCell(in92);
			
			PdfPCell in101=new PdfPCell(new Paragraph("10.Address:",font3));
			PdfPCell in102=new PdfPCell(new Paragraph(details[12]+":\n"+details[13]+"\n"+details[14]+"\n"+details[15]+", "+details[16]+", "+details[20]+"\nPin-"+details[17],font3));
			in101.setBorderColor(BaseColor.WHITE);
			in102.setBorderColor(BaseColor.WHITE);
			in101.setMinimumHeight(20f);
			in102.setMinimumHeight(20f);
			intable.addCell(in101);
			intable.addCell(in102);
			
			PdfPCell in111=new PdfPCell(new Paragraph("11.Account Type:",font3));
			PdfPCell in112=new PdfPCell(new Paragraph(details[23],font3));
			in111.setBorderColor(BaseColor.WHITE);
			in112.setBorderColor(BaseColor.WHITE);
			in111.setMinimumHeight(20f);
			in112.setMinimumHeight(20f);
			intable.addCell(in111);
			intable.addCell(in112);
			
			PdfPCell in121=new PdfPCell(new Paragraph("12.Initial Balance:\n(To be deposited at the branch with this form)",font3));
			PdfPCell in122=new PdfPCell(new Paragraph("Rs. "+details[24],font3));
			in121.setBorderColor(BaseColor.WHITE);
			in122.setBorderColor(BaseColor.WHITE);
			in121.setMinimumHeight(20f);
			in122.setMinimumHeight(20f);
			intable.addCell(in121);
			intable.addCell(in122);
			
			String[] facilities = {"Cheque Book","ATM-cum-Debit Card","Internet Banking","SMS Notifications","Mobile Banking"};
			
			PdfPCell in131=new PdfPCell(new Paragraph("13.Additional Facilities:",font3));
			PdfPCell in132=new PdfPCell();
			for(int i=25;i<=29;i++)
			{
				if(details[i]!=null)
				in132.addElement(new Paragraph(facilities[i-25],font3));
			}
			in131.setBorderColor(BaseColor.WHITE);
			in132.setBorderColor(BaseColor.WHITE);
			in131.setMinimumHeight(20f);
			in132.setMinimumHeight(20f);
			intable.addCell(in131);
			intable.addCell(in132);
			
			PdfPCell in141=new PdfPCell(new Paragraph("14.Identity Proof:",font3));
			PdfPCell in142=new PdfPCell(new Paragraph(details[30]+"\n"+details[31],font3));
			in141.setBorderColor(BaseColor.WHITE);
			in142.setBorderColor(BaseColor.WHITE);
			in141.setMinimumHeight(20f);
			in142.setMinimumHeight(20f);
			intable.addCell(in141);
			intable.addCell(in142);
			
			PdfPCell in151=new PdfPCell(new Paragraph("15.Address Proof:",font3));
			PdfPCell in152=new PdfPCell(new Paragraph(details[32]+"\n"+details[33],font3));
			in151.setBorderColor(BaseColor.WHITE);
			in152.setBorderColor(BaseColor.WHITE);
			in151.setMinimumHeight(20f);
			in152.setMinimumHeight(20f);
			intable.addCell(in151);
			intable.addCell(in152);

			
			PdfPCell cell1 = new PdfPCell(intable);
			cell1.setPaddingLeft(10);
			cell1.setBorderColor(BaseColor.WHITE);
			
			//Image
			new File("\\Test").mkdir();//Making Test Directory
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_bank","root","petervsock");
		
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from temp_regd where mail='"+details[5]+"'");
			
			if(rs.next()){//now on 1st row  
	              
				Blob b1=rs.getBlob(22);//2 means 2nd column data  
				byte barr1[]=b1.getBytes(1,(int)b1.length());//1 means first image  
				              
				OutputStream fout1=new FileOutputStream("\\Test\\photo.jpg");  
				fout1.write(barr1);  
				              
				fout1.close();  
				
			
			}
			
			Statement stmt1 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery("select * from temp_regd where mail='"+details[5]+"'");
			if(rs1.next())
			{
				Blob b2=rs.getBlob(23);//2 means 2nd column data  
				byte barr2[]=b2.getBytes(1,(int)b2.length());//1 means first image  
				              
				OutputStream fout2=new FileOutputStream("\\Test\\sign.jpg");  
				fout2.write(barr2);  
				              
				fout2.close();  
			}
			
			ImageTest2.resize();
			
			Image image = Image.getInstance("\\Test\\photosize.jpg");
			image.scaleAbsolute(150, 200);
			image.setBorder(1);
			PdfPCell cell2 = new PdfPCell(image);
			cell2.setPaddingTop(8);
			cell2.setPaddingLeft(0);
			cell2.setBorderColor(BaseColor.WHITE);
			
			
			table.addCell(cell1);
		    table.addCell(cell2);
			
			doc.add(table);
			
			ImageTest.resize();
			
			Image image2 = Image.getInstance("\\Test\\signsize.jpg");
			image.scaleAbsolute(100, 50);
			
			Paragraph p2=new Paragraph("(Uploaded Signature)                                                    ",font4);
			p2.setAlignment(Element.ALIGN_RIGHT);
			p2.setSpacingAfter(3);
			doc.add(p2);
		    
			PdfPTable table2=new PdfPTable(3);
			float[] columnWidths3 = {1f,1f,1.5f};
			table2.setWidths(columnWidths3);
			
			PdfPCell cell00=new PdfPCell();
			cell00.setMinimumHeight(50f);
			cell00.setBorderColor(BaseColor.WHITE);
			table2.addCell(cell00);
			
			PdfPCell cell01=new PdfPCell();
			cell00.setMinimumHeight(50f);
			cell01.setBorderColor(BaseColor.WHITE);
			table2.addCell(cell01);
			
			PdfPCell cell02=new PdfPCell(image2);
			cell00.setMinimumHeight(50f);
			cell02.setBorderColor(BaseColor.BLACK);
			cell02.setPadding(5);
			cell02.setPaddingLeft(13);
			table2.addCell(cell02);
			
			table2.setSpacingAfter(10);
			
			doc.add(table2);
			
			Paragraph p3=new Paragraph("(Specimen Signature)                                                    \nTo be filled by the Applicant                                             ",font4);
			p3.setAlignment(Element.ALIGN_RIGHT); 
			p3.setSpacingAfter(2);
			doc.add(p3);
		    
			PdfPTable table3=new PdfPTable(3);
			float[] columnWidths4 = {1f,1f,1.5f};
			table3.setWidths(columnWidths4);
			
			PdfPCell cell10=new PdfPCell();
			cell10.setMinimumHeight(50f);
			cell10.setBorderColor(BaseColor.WHITE);
			table3.addCell(cell10);
			
			PdfPCell cell11=new PdfPCell();
			cell11.setMinimumHeight(50f);
			cell11.setBorderColor(BaseColor.WHITE);
			table3.addCell(cell11);
			
			PdfPCell cell12=new PdfPCell();
			cell12.setMinimumHeight(50f);
			cell12.setBorderColor(BaseColor.BLACK);
			table3.addCell(cell12);
			
			doc.add(table3);


			
			
			doc.close();
			
			deleteDir(new File("\\Test"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static boolean deleteDir(File dir) {
	      if (dir.isDirectory()) {
	         String[] children = dir.list();
	         for (int i = 0; i < children.length; i++) {
	            boolean success = deleteDir (new File(dir, children[i]));
	            
	            if (!success) {
	               return false;
	            }
	         }
	      }
	      return dir.delete();
	   }

}
