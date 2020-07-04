package controllers.employees;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import utils.DBUtil;

/**
 * Servlet implementation class EmployeesEditServlet
 */
@WebServlet("/employees/edit")
public class EmployeesEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeesEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // EntityManagerのオブジェクトを生成
        EntityManager em = DBUtil.createEntityManager();

        /** emオブジェクトを使って、EmployeeクラスからIDを指定してデータを取り出す。
         * em.find()メソッドの引数は、em.find(クラス名.class, データ番号(ここではID))となる(Lesson9.6.4参照)
         * IDはrequest.getParameterメソッドで取得(元がInteger型なのでInteger型にキャストする。)
         */
        Employee e = em.find(Employee.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("employee", e);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("employee_id", e.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/employees/edit.jsp");
        rd.forward(request, response);

    }

}
