<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
    <c:if test="${flush != null}">
        <div id="flush_success">
            <c:out value="${flush}"></c:out>
        </div>
    </c:if>
    <h2>日報　一覧</h2>
    <div class="report_search">
        <h4>
        日報を<br />
        </h4>
        <form method="POST" action="<c url value='/reports/search'>">
            <select name="keyword_type">
                <option value="name">投稿者氏名</option>
                <option value="title">タイトル</option>
            </select>
            <h4>で検索</h4>
            <input type="text" name="keyword" value=${report.keyword} />
        </form>
    </div>
    <br />
    <table id="report_list">
        <tbody>
            <tr>
                <th class="report_name">氏名</th>
                <th class="report_date">日付</th>
                <th class="report_title">タイトル</th>
                <th class="report_action">操作</th>
            </tr>
            <c:forEach var="report" items="${reports}" varStatus="status">
                <tr>
                    <td class="report_name"><c:out value="${report.employee.name}" /></td>
                    <td class="report_date"><c:out value="${report.report_date}" /></td>
                    <td class="report_title">${report.title}</td>
                    <td class="report_action"><a href="<c:url value='/reports/show?id=${report.id}' />">詳細を見る</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div id="pagination">
        (全 ${reports_count} 件)<br />
        <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}" step="1">
            <c:choose>
                <c:when test="${i == page}">
                    <c:out value="${i}" />&nbsp;
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/reports/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

    <p><a href="<c:url value='/reports/new' />">新規日報の登録</a></p>

    </c:param>
</c:import>