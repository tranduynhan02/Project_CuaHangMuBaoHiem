<%--
  Created by IntelliJ IDEA.
  User: TranDangQuoc
  Date: 02/01/2023
  Time: 8:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ContactService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý Trang chủ</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="admin/assets/css/tailwind.output.css" />
    <link rel="stylesheet" href="admin/assets/css/filter.css" />
    <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
    ></script>
    <script src="admin/assets/js/init-alpine.js"></script>
    <link href="fontawesome-free-6.2.1/css/all.css" rel="stylesheet">
</head>
<body>
<div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen}"
>

    <!-- Mobile sidebar -->
    <!-- Backdrop -->
    <div class="flex flex-col flex-1 w-full">
        <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
            <div class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">

                <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct"> <button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    Back
                </button></a>
                <!-- Search input -->

                <ul class="flex items-center flex-shrink-0 space-x-6">


                </ul>
            </div>
        </header>
        <main class="h-full pb-16 overflow-y-auto">
            <div class="container grid px-6 mx-auto">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                    Quản lý SlideShow
                </h2>
                <!-- Filter-->
                <!-- With actions -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                </h4>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full whitespace-no-wrap">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Hình ảnh</th>
                                <th class="px-4 py-3">Hiển thị</th>
                                <th class="px-4 py-3">Chỉnh sửa</th>
                            </tr>
                            </thead>
                            <tbody
                                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <%
                                List<SlideShow> list = (List<SlideShow>) request.getAttribute("img1");
                                for(SlideShow c : list){
                            %>
                            <tr class="text-gray-700 dark:text-gray-400">

                                <td class="px-4 py-3">
                                    <a href="#">
                                        <div class="flex items-center text-sm">
                                            <!-- Avatar with inset shadow -->
                                            <div
                                                    class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                                            >
                                                <img
                                                        class="object-cover w-full h-full rounded-full"
                                                        src="<%= c.getImg()%>"
                                                        alt=""
                                                        loading="lazy"
                                                />
                                                <div
                                                        class="absolute inset-0 rounded-full shadow-inner"
                                                        aria-hidden="true"
                                                ></div>
                                            </div>
                                            <div>
                                                <p class="font-semibold"></p>
                                                <p class="text-xs text-gray-600 dark:text-gray-400">

                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </td>
                                <form action="/Project_CuaHangMuBaoHiem_war/UpdateAllowSlideShow">
                                <td class="px-4 py-3 text-sm">
                                    <input name="id" type="hidden" value="<%= c.getId()%>">
                <select id="allow2" name="allow" class="pix_text">

                    <option  value="<%= c.getAllow() %>"><%=c.allow(c.getAllow()) %></option>
                    <option value="<%= c.OppoAllow(c.getAllow()) %>"><%=c.OppositionAllow(c.getAllow()) %></option>

                </select>
                                </td>
                                <td class="px-4 py-3">
                                    <div class="flex items-center space-x-4 text-sm">


                                        <button type="submit" >
                                            <i class="fa fa-refresh" ></i>
                                        </button>

                                        <a href="<%="/Project_CuaHangMuBaoHiem_war/RemoveSlideShow?id=" + c.getId()%>">
                                            <button type="button"
                                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                    aria-label="Delete">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                                    <path
                                                            fill-rule="evenodd"
                                                            d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                            clip-rule="evenodd"
                                                    ></path>
                                                </svg>
                                            </button>
                                        </a>
                                    </div>
                                </td>
                                </form>
                    </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div
                            class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
                    >
                <span class="flex items-center col-span-3">

                </span>
                        <span class="col-span-2"></span>
                        <!-- Pagination -->

                    </div>
                </div>
            </div>
            <div class="container px-6 mx-auto" style="margin-top: 20px;">
                <form action="/Project_CuaHangMuBaoHiem_war/UploadSlideShow" method="post" enctype="multipart/form-data">
                    Tải lên hình ảnh:
                <input type="file" name="fileName">
                        <button type="submit" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                            Thêm
                        </button>
                </form>
            </div>
            <div class="container grid px-6 mx-auto">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                    Quản lý Banner
                </h2>
                <!-- Filter-->
                <!-- With actions -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                </h4>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full whitespace-no-wrap">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Hình ảnh</th>
                                <th class="px-4 py-3">Hiển thị</th>
                                <th class="px-4 py-3">Giảm giá(%)</th>
                                <th class="px-4 py-3">Nội dung</th>
                                <th class="px-4 py-3">Chỉnh sửa</th>
                            </tr>
                            </thead>
                            <tbody
                                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <%
                                List<SlideShow> list2 = (List<SlideShow>) request.getAttribute("img2");
                                for(SlideShow c : list2){
                            %>
                            <tr class="text-gray-700 dark:text-gray-400">

                                <td class="px-4 py-3">
                                    <a href="#">
                                        <div class="flex items-center text-sm">
                                            <!-- Avatar with inset shadow -->
                                            <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                <img class="object-cover w-full h-full rounded-full"
                                                        src="<%= c.getImg()%>"
                                                        alt=""
                                                        loading="lazy"/>
                                                <div
                                                        class="absolute inset-0 rounded-full shadow-inner"
                                                        aria-hidden="true"
                                                ></div>
                                            </div>
                                            <div>
                                                <p class="font-semibold"></p>
                                                <p class="text-xs text-gray-600 dark:text-gray-400">

                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </td>
                                <form action="/Project_CuaHangMuBaoHiem_war/UpdateBanner">

                                <td class="px-4 py-3 text-sm">


                                    <input name="id" type="hidden" value="<%= c.getId() %>" >
                                    <select id="allow" name="allow" class="pix_text">

                                        <option  value="<%= c.getAllow() %>"><%=c.allow(c.getAllow()) %></option>
                                        <option value="<%= c.OppoAllow(c.getAllow()) %>"><%=c.OppositionAllow(c.getAllow()) %></option>

                                    </select>

                                </td>
                                    <td class="px-4 py-3 text-sm">
                                        <input type="number" name="discount" style="width: 150px;" value="<%= c.getDiscount()*100 %>" >
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                        <input name="content" style="width: 150px;" value="<%= c.getContent() %>" >
                                    </td>
                                <td class="px-4 py-3">
                                    <div class="flex items-center space-x-4 text-sm">

                                        <button type="submit" >
                                            <i class="fa fa-refresh" ></i>
                                        </button>

                                        <a href="<%="/Project_CuaHangMuBaoHiem_war/RemoveBanner?id=" + c.getId()%>">
                                            <button type="button"
                                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                    aria-label="Delete">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                                    <path
                                                            fill-rule="evenodd"
                                                            d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                            clip-rule="evenodd"
                                                    ></path>
                                                </svg>
                                            </button>
                                        </a>
                                    </div>
                                </td>
                                </form>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div
                            class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
                    >
                <span class="flex items-center col-span-3">

                </span>
                        <span class="col-span-2"></span>
                        <!-- Pagination -->

                    </div>
                </div>
            </div>
            <div class="container px-6 mx-auto" style="margin-top: 20px;">
                <form action="/Project_CuaHangMuBaoHiem_war/UploadBanner" method="post" enctype="multipart/form-data">
                    Tải lên hình ảnh:
                    <input type="file" name="fileName">
                    <button type="submit" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                        Thêm
                    </button>
                </form>

            </div>
            <div class="container grid px-6 mx-auto">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                    Quản lý Logo
                </h2>
                <!-- Filter-->
                <!-- With actions -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                </h4>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full whitespace-no-wrap">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Hình ảnh</th>
                                <th class="px-4 py-3">Hiển thị</th>
                                <th class="px-4 py-3">Tên thương hiệu</th>
                                <th class="px-4 py-3">Chỉnh sửa</th>
                            </tr>
                            </thead>
                            <tbody
                                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <%
                                List<SlideShow> list3 = (List<SlideShow>) request.getAttribute("img3");
                                for(SlideShow c : list3){
                            %>
                            <tr class="text-gray-700 dark:text-gray-400">

                                <td class="px-4 py-3">
                                    <a href="#">
                                        <div class="flex items-center text-sm">
                                            <!-- Avatar with inset shadow -->
                                            <div
                                                    class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                                            >
                                                <img
                                                        class="object-cover w-full h-full rounded-full"
                                                        src="<%= c.getImg()%>"
                                                        alt=""
                                                        loading="lazy"
                                                />
                                                <div
                                                        class="absolute inset-0 rounded-full shadow-inner"
                                                        aria-hidden="true"
                                                ></div>
                                            </div>
                                            <div>
                                                <p class="font-semibold"></p>
                                                <p class="text-xs text-gray-600 dark:text-gray-400">

                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                </td>
                                <form action="/Project_CuaHangMuBaoHiem_war/UpdateLogo">

                                <td class="px-4 py-3 text-sm">

                                    <input name="id" type="hidden" value="<%= c.getId() %>" >
                                    <select id="allow3" name="allow" class="pix_text">

                                        <option  value="<%= c.getAllow() %>"><%=c.allow(c.getAllow()) %></option>
                                        <option value="<%= c.OppoAllow(c.getAllow()) %>"><%=c.OppositionAllow(c.getAllow()) %></option>

                                    </select>

                                </td>
                                    <td class="px-4 py-3 text-sm">
                                        <input name="name" style="width: 150px;" value="<%= c.getName() %>" >
                                    </td>
                                <td class="px-4 py-3">
                                    <div class="flex items-center space-x-4 text-sm">

                                        <button type="submit">
                                            <i class="fa fa-refresh" ></i>
                                        </button>

                                        <a href="<%="/Project_CuaHangMuBaoHiem_war/RemoveLogo?id=" + c.getId()%>">
                                            <button
                                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                    aria-label="Delete">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                                    <path
                                                            fill-rule="evenodd"
                                                            d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                            clip-rule="evenodd"
                                                    ></path>
                                                </svg>
                                            </button>
                                        </a>
                                    </div>
                                </td>
                                </form>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div
                            class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
                    >
                <span class="flex items-center col-span-3">

                </span>
                        <span class="col-span-2"></span>
                        <!-- Pagination -->

                    </div>
                </div>
            </div>
            <div class="container px-6 mx-auto" style="margin-top: 20px;">
                <form action="/Project_CuaHangMuBaoHiem_war/UploadLogo" method="post" enctype="multipart/form-data">
                    Tải lên hình ảnh:
                    <input type="file" name="fileName">
                    <button type="submit" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                        Thêm
                    </button>
                </form>

            </div>
        </main>

    </div>
</div>
</body>
</html>

