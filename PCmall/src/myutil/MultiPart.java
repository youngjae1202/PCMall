package myutil;

import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

import java.util.*;
import java.io.*;

public class MultiPart extends HttpServlet {

   List items;

   // 생성자
   public MultiPart(HttpServletRequest request) throws Exception {
      FileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      items = upload.parseRequest(request);

   }

   // 주어진 이름에 해당하는 데이터값을 리턴하는 메소드
   public String getParameter(String filedName) throws UnsupportedEncodingException {
      for (int cnt = 0; cnt < items.size(); cnt++) {

         FileItem item = (FileItem) items.get(cnt);
         if (item.getFieldName().equals(filedName)) {
            return item.getString("utf-8");

         }

      }
      return null;

   }

   // 주어진 이름에 해당하는업로드 파일의 경로명을 리턴하는 메소드
   public String getFilePath(String filedName) throws UnsupportedEncodingException {
      for (int cnt = 0; cnt < items.size(); cnt++) {
         FileItem item = (FileItem) items.get(cnt);
         if (item.getFieldName().equals(filedName)) {
            return item.getName();
         }
      }
      return null;
   }

   // 주어진 이름에 해당하는업로드 파일의 이름을 리턴하는 메소드
   public String getFileName(String filedName) throws UnsupportedEncodingException {
      String path = getFilePath(filedName);

      int index1 = path.lastIndexOf("/");

      int index2 = path.lastIndexOf("\\");

      int index = 0;

      if (index1 > index2) {
         index = index1;
      } else {
         index = index2;
      }

      if (index < 0) {
         return path;
      } else {
         return path.substring(index + 1);
      }

   }

   // 주어진 이름에 해당하는 업로드 파일을 저장하는 메소드
   public void saveFile(String fieldName, String path) throws Exception {
      for (int cnt = 0; cnt < items.size(); cnt++) {
         FileItem item = (FileItem) items.get(cnt);

         if (item.getFieldName().equals(fieldName)) {
            if (!item.isFormField()) {
               item.write(new File(path));
               return;
            }
         }
      }

   }
}