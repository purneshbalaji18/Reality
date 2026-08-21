import io
from PIL import Image, ImageEnhance, ImageFilter
from typing import Optional


class OCRService:
    """OCR Processing Service using Tesseract with image pre-processing"""

    def process_image_bytes(self, image_bytes: bytes) -> str:
        try:
            import pytesseract

            # Load image
            image = Image.open(io.BytesIO(image_bytes))

            # Preprocessing: convert to grayscale, enhance contrast, sharpen
            gray_image = image.convert("L")
            contrast_enhancer = ImageEnhance.Contrast(gray_image)
            enhanced_image = contrast_enhancer.enhance(2.0)
            sharpened_image = enhanced_image.filter(ImageFilter.SHARPEN)

            # Perform Tesseract OCR
            raw_text = pytesseract.image_to_string(sharpened_image, config="--psm 6")
            
            # Clean up OCR output
            cleaned_text = self._clean_ocr_text(raw_text)
            return cleaned_text

        except ImportError:
            print("[OCRService] pytesseract not available or binary missing. Returning raw text indicator.")
            return "OCR processing failed: Tesseract engine not installed on system."
        except Exception as e:
            print(f"[OCRService] Error during image processing: {e}")
            return ""

    def _clean_ocr_text(self, text: str) -> str:
        lines = [line.strip() for line in text.split("\n") if line.strip()]
        return " ".join(lines)


ocr_service = OCRService()
