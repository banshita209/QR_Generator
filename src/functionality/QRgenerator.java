package functionality;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRgenerator {

	public String createQRImage(String qrCodeText, String name) {
		// Create the ByteMatrix for the QR-Code that encodes the given String

		System.out.println("generate QR code generation");
		String fileType = "png";
		int size = 150;
		String filePath = "H:\\eclipse-workspace\\QR_Generator\\WebContent\\QRs\\" + name + ".png";
		System.out.println(filePath);
		File qrFile = new File(filePath);

		Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<EncodeHintType, ErrorCorrectionLevel>();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

		QRCodeWriter qrCodeWriter = new QRCodeWriter();

		BitMatrix byteMatrix = null;
		try {
			byteMatrix = qrCodeWriter.encode(qrCodeText, BarcodeFormat.QR_CODE, size, size, hintMap);
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Make the BufferedImage that are to hold the QRCode

		int matrixWidth = byteMatrix.getWidth();
		BufferedImage image = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);

		image.createGraphics();

		Graphics2D graphics = (Graphics2D) image.getGraphics();
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, matrixWidth, matrixWidth);

		// Paint and save the image using the ByteMatrix

		graphics.setColor(Color.BLACK);

		for (int i = 0; i < matrixWidth; i++) {
			for (int j = 0; j < matrixWidth; j++) {
				if (byteMatrix.get(i, j)) {
					graphics.fillRect(i, j, 1, 1);
				}
			}
		}
		try {
			ImageIO.write(image, fileType, qrFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(filePath);
		return filePath;
	}

	/*
	 * public static void main(String[] args) { createQRImage("banshita",
	 * "example"); }
	 */

}
