package com.mc.common.util;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Hashtable;
import javax.imageio.ImageIO;
import org.springframework.stereotype.Component;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code128Writer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

@Component
public class BarCodeUtil {
		/** * 바코드 유틸 
		* @param text : 바코드에 작성할 내용이다 
		* @param width : 바코드 이미지 가로사이즈 
		* @param height : 바코드 이미지 세로사이즈 
		* @param file_path : 생성할파일의 디렉토리경로 
		* @param file_name : 생성할 파일의 파일명 
		*/ 
		public static void getBarCodeImage(String text, int width, int height, String file_path, String file_name) { 
			try { 
				text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
				Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<>(); 
				hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L); 
				Writer writer = new Code128Writer(); 
				BitMatrix bitMatrix = writer.encode(text, BarcodeFormat.CODE_128, width, height);
				int brColor = 0xFF004555; 
				MatrixToImageConfig config = new MatrixToImageConfig(brColor,0xFFFFFFFF);
				BufferedImage brImage = MatrixToImageWriter.toBufferedImage(bitMatrix,config); 
				ImageIO.write(brImage, "png", new File(file_path+file_name)); 
			} catch (Exception e) { 
				e.printStackTrace();
			} 
		}
		/** * 바코드이미지와 상품 이미지 합성 
		* @param imagePath1 : 상품이미지 경로 
		* @param imagePath2 : 바코드이미지 경로 
		*/ 
		public static void getImageMerge(String imagePath1, String imagePath2) { 
			try { 
				BufferedImage image1 = ImageIO.read(new File(imagePath1));
				BufferedImage image2 = ImageIO.read(new File(imagePath2));

				int width = Math.max(image1.getWidth(), image2.getWidth());
				int height = image1.getHeight() + image2.getHeight();

				BufferedImage mergedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

				graphics.setBackground(Color.WHITE);
				graphics.drawImage(image1, 0, 0, null);
				graphics.drawImage(image2, 0, image1.getHeight(), null);
			   
			   ImageIO.write(mergedImage, "png", new File(imagePath2));
			} catch (Exception e) { 
				e.printStackTrace();
			} 
		}
}
