package controllers.reports;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import models.Report;
import utils.DBUtil;


/**
 * Servlet implementation class ReportsSearchServlet
 */
@WebServlet("/reports/search")
public class ReportsSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportsSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        String keyword = "%" + request.getParameter("keyword") + "%";
        Report r = new Report();
        r.setEmployee((Employee)request.getSession().getAttribute("login_employee"));

        List<Report> reports = em.createNamedQuery("getKeywordReports", Report.class)
                                  .setParameter("employee", keyword)
                                  .getResultList();



        response.sendRedirect(request.getContextPath() + "/reports/index");
    }

}
