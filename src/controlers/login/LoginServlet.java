package controlers.login;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    // ログイン画面の表示
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("hasError", false);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

    // ログイン処理を実行
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 認証結果を格納する変数
        Boolean check_result = false;

        // フォームから入力された値の取得。
        String code = request.getParameter("code");
        String plain_pass = request.getParameter("password");

        //プロパティを格納するEmployeeクラスの変数eを定義。
        Employee e = null;

        if(code != null && !code.equals("") && plain_pass != null && !plain_pass.equals("")) {
            EntityManager em = DBUtil.createEntityManager();

            String password = EncryptUtil.getPasswordEncrypt(
                    plain_pass,
                    (String)this.getServletContext().getAttribute("salt")
                    );
            // パスワードは暗号化されてDBに登録されるため、フォームからの入力値にEncryptUtil.getPasswordEncrypt()を連結。

            // 社員番号とパスワードが正しいかチェックする
            try {
                e = em.createNamedQuery("checkLoginCodeAndPassword", Employee.class)
                        .setParameter("code", code)
                        .setParameter("pass", password)
                        .getSingleResult();
            } catch(NoResultException ex) {}

            em.close();

            if(e != null) {
                check_result = true;
            }
        }

        if(!check_result) {
            // 認証できなかったらログイン画面に戻る
            request.setAttribute("_token", request.getSession().getId());
            request.setAttribute("hasError", true);
            request.setAttribute("code", code);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
            rd.forward(request, response);
        } else {
            // 認証できたらログイン状態にしてトップページへリダイレクト
            /** eで取得した従業員情報(のオブジェクト)をlogin_employeeという名前で、セッションスコープへ格納。
             *  「セッションスコープにlogin_employeeの名前で従業員のオブジェクトが保存されている状態」を
             *  ログイン状態とする。
             */
            request.getSession().setAttribute("login_employee", e);

            request.getSession().setAttribute("flush", "ログインしました。");
            response.sendRedirect(request.getContextPath() + "/");
        }

    }

}
