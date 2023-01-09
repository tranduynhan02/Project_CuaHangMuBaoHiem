<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Quản lý sản phẩm</title>
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
</head>
<body>
<div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen}"
>
  <!-- Desktop sidebar -->
  <aside
          class="z-20 flex-shrink-0 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block"
  >
    <div class="py-4 text-gray-500 dark:text-gray-400">
      <a
              class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
              href="/Project_CuaHangMuBaoHiem_war/ManageProduct"
      >
        Admin
      </a>
      <ul class="mt-6">
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="/Project_CuaHangMuBaoHiem_war/Home"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
              ></path>
            </svg>
            <span class="ml-4">Về trang bán hàng</span>
          </a>
        </li>
      </ul>
      <ul>
        <li class="relative px-6 py-3">
              <span
                      class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                      aria-hidden="true"
              ></span>
          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="/Project_CuaHangMuBaoHiem_war/ManageProduct"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lý sản phẩm</span>
          </a>
        </li>
        <li class="relative px-6 py-3">

          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="/Project_CuaHangMuBaoHiem_war/list-bill"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lý hóa đơn</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="/Project_CuaHangMuBaoHiem_war/list-customer">
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lý khách hàng</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="/Project_CuaHangMuBaoHiem_war/ManageHome"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor">
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lý trang chủ</span>
          </a>
        </li>
      </ul>

    </div>
  </aside>
  <!-- Mobile sidebar -->
  <!-- Backdrop -->
  <div class="flex flex-col flex-1 w-full">
    <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
      <div
              class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
      >
        <!-- Mobile hamburger -->
        <button
                class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
                @click="toggleSideMenu"
                aria-label="Menu"
        >
          <svg
                  class="w-6 h-6"
                  aria-hidden="true"
                  fill="currentColor"
                  viewBox="0 0 20 20"
          >
            <path
                    fill-rule="evenodd"
                    d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                    clip-rule="evenodd"
            ></path>
          </svg>
        </button>
        <!-- Search input -->
        <div class="flex justify-center flex-1 lg:mr-32">
          <div
                  class="relative w-full max-w-xl mr-6 focus-within:text-purple-500"
          >
            <div class="absolute inset-y-0 flex items-center pl-2">
              <svg
                      class="w-4 h-4"
                      aria-hidden="true"
                      fill="currentColor"
                      viewBox="0 0 20 20"
              >
                <path
                        fill-rule="evenodd"
                        d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                        clip-rule="evenodd"
                ></path>
              </svg>
            </div>
            <input
                    class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                    type="text"
                    placeholder="Tìm kiếm"
                    aria-label="Search"
            />
          </div>
        </div>
        <ul class="flex items-center flex-shrink-0 space-x-6">
          <!-- Theme toggler -->
          <li class="flex">
            <button
                    class="rounded-md focus:outline-none focus:shadow-outline-purple"
                    @click="toggleTheme"
                    aria-label="Toggle color mode"
            >
              <template x-if="!dark">
                <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                >
                  <path
                          d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"
                  ></path>
                </svg>
              </template>
              <template x-if="dark">
                <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                >
                  <path
                          fill-rule="evenodd"
                          d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                          clip-rule="evenodd"
                  ></path>
                </svg>
              </template>
            </button>
          </li>
          <!-- Notifications menu -->
          <li class="relative">

            <a href="/Project_CuaHangMuBaoHiem_war/ManageContact">
            <button  class="relative align-middle rounded-md focus:outline-none focus:shadow-outline-purple" @click="toggleNotificationsMenu" @keydown.escape="closeNotificationsMenu" aria-label="Notifications" aria-haspopup="true">
              <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
              </svg>
            </button>
            </a>
          </li>
          <!-- Profile menu -->
          <li class="relative">
            <button
                    class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                    @click="toggleProfileMenu"
                    @keydown.escape="closeProfileMenu"
                    aria-label="Account"
                    aria-haspopup="true"
            >
              <img
                      class="object-cover w-8 h-8 rounded-full"
                      src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
                      alt=""
                      aria-hidden="true"
              />
            </button>
            <template x-if="isProfileMenuOpen">
              <ul
                      x-transition:leave="transition ease-in duration-150"
                      x-transition:leave-start="opacity-100"
                      x-transition:leave-end="opacity-0"
                      @click.away="closeProfileMenu"
                      @keydown.escape="closeProfileMenu"
                      class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
                      aria-label="submenu"
              >
                <li class="flex">
                  <a
                          class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                          href="#"
                  >
                    <svg
                            class="w-4 h-4 mr-3"
                            aria-hidden="true"
                            fill="none"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                      <path
                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                      ></path>
                    </svg>
                    <span>Hồ sơ</span>
                  </a>
                </li>
                <li class="flex">
                  <a
                          class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                          href="#"
                  >
                    <svg
                            class="w-4 h-4 mr-3"
                            aria-hidden="true"
                            fill="none"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                      <path
                              d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"
                      ></path>
                      <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    <span>Cài đặt</span>
                  </a>
                </li>
                <li class="flex">
                  <a
                          class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                          href="#"
                  >
                    <svg
                            class="w-4 h-4 mr-3"
                            aria-hidden="true"
                            fill="none"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                      <path
                              d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"
                      ></path>
                    </svg>
                    <span>Đăng xuất</span>
                  </a>
                </li>
              </ul>
            </template>
          </li>
        </ul>
      </div>
    </header>
    <main class="h-full pb-16 overflow-y-auto">
      <div class="px-6 my-6" style="width: 300px">
        <a href="forms.jsp">
          <button class="flex items-center justify-between w-full px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
            Tạo mới sản phẩm
            <span class="ml-2" aria-hidden="true">+</span>
          </button>
        </a>
      </div>
      <div class="container grid px-6 mx-auto">
        <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
          Danh sách sản phẩm
        </h2>
        <!-- Filter-->


        <!-- With actions -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >

        </h4>
        <div class="w-full overflow-hidden rounded-lg shadow-xs">
          <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
              <thead>
              <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                <th class="px-4 py-3">Tên sản phẩm</th>
                <th class="px-4 py-3">Giá tiền</th>
                <th class="px-4 py-3">Số lượng</th>
                <th class="px-4 py-3">Thương hiệu</th>
                <th class="px-4 py-3">Chỉnh sửa</th>
              </tr>
              </thead>
              <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">

              <%
                List<Product> data = (List<Product>) request.getAttribute("list");
                NumberFormat nf = new NumberFormat();
                int first = 0, last = 0, pages = 1;

                if (request.getParameter("pages") != null) {
                  pages = (int) Integer.parseInt(request.getParameter("pages"));
                }
                int total = new ProductService().countProduct();
                if (total <= 10) {
                  first = 0;
                  last = total;
                } else {
                  first = (pages - 1) * 10;
                  last = 10;
                }
                List<Product> list = new ProductService().pagination(first,last,data);
                for (Product p : list) {
              %>
                <tr class="text-gray-700 dark:text-gray-400">
                  <td class="px-4 py-3">

                      <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                        <div
                                class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                        >
                          <img
                                  class="object-cover w-full h-full rounded-full"
                                  <%if(p.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%>src="<%= p.getImg().get(0).getImg()%>"<%}%>
                                  alt=""
                                  loading="lazy"
                          />
                          <div
                                  class="absolute inset-0 rounded-full shadow-inner"
                                  aria-hidden="true"
                          ></div>
                        </div>
                        <div>
                          <p class="font-semibold"><%= p.getName()%></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">
                            <%= p.getId()%>
                          </p>
                        </div>
                      </div>

                  </td>
                  <td class="px-4 py-3 text-sm">
                    <%= nf.numberFormat(p.getPrice())%>đ
                  </td>
                  <td class="px-4 py-3 text-sm">
                    <%= p.sumQuantity()%>
                  </td>
                  <td class="px-4 py-3 text-sm">
                    <%= p.getBrand()%>
                  </td>
                  <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">

                        <a href="<%= "/Project_CuaHangMuBaoHiem_war/DetailProduct?id=" + p.getId()+"&pages="+pages%>">
                      <button
                              class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                              aria-label="Edit">
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="currentColor"
                                viewBox="0 0 20 20">
                          <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path>
                        </svg>
                      </button>
                        </a>
                      <form method="get" action="/Project_CuaHangMuBaoHiem_war/Remove">
                        <input type="hidden" name="id" value="<%= p.getId() %>">
                        <button
                                class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                aria-label="Delete"
                        >
                          <svg
                                  class="w-5 h-5"
                                  aria-hidden="true"
                                  fill="currentColor"
                                  viewBox="0 0 20 20"
                          >
                            <path
                                    fill-rule="evenodd"
                                    d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                    clip-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </form>
                    </div>
                  </td>
                </tr>
                <%}%>
              </tbody>
            </table>
          </div>
          <div
                  class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                <span class="flex items-center col-span-3">
                 <% int f;
                   if(first+last>total){
                     f= total;
                   }else{
                     f = first+last;
                   }
                 %>
                  Hiển thị <%= first+1%>-<%=f%> của <%=total%>
                </span>
            <span class="col-span-2"></span>
            <!-- Pagination -->
            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">
                      <%   //Button Previous
                        int back = 0;
                        if (pages == 0 || pages == 1) {
                          back = 1;//Luon la page 1
                        } else {
                          back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                        }
                      %>

                      <li>
                        <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct?pages=<%=back%>">
                            <button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                                    aria-label="Previous">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>
                        </button>
                      </a>
                      </li>
                        <%
                          //Button Number pages
                          int loop = 0, num = 0;
                          if ((total / 10) % 2 == 0) {
                            num = total / 10;
                          } else {
                            num = (total + 1) / 10;
                          }
                          //Nếu total lẻ thêm 1
                          if (total % 2 != 0) {
                            loop = (total / 10) + 1;

                          } else {
                            //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                            if (total < (num * 10) + 10 && total != num * 10) {
                              loop = (total / 10) + 1;
                            } else {
                              //Nếu bằng fullPage thì không thêm
                              loop = (total / 10);
                            }
                          }
                          //Lap so pages
                          for (int i = 1; i <= loop; i++) {%>
                <% if (pages == i) {%>

                      <li>
                          <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct?pages=<%=i%>">
                        <button
                                class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          <%= i %>
                        </button>
                          </a>
                      </li>
                        <%} else {%>

                        <li>
                          <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct?pages=<%=i%>">
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
                          <%= i %>
                        </button>
                          </a>
                      </li>
                        <%}
                        }%>
                        <%
                          //Button Next
                          int next = 0;
                          //Nếu total lẻ
                          if (total % 2 != 0) {
                            if (pages == (total / 10) + 1) {
                              next = pages;//Khong next
                            } else {
                              next = pages + 1;//Co next
                            }
                          } else {
                            //Nếu total chẵn nhỏ hơn fullpage
                            //Và không fullPage thì thêm 1
                            if (total < (num * 10) + 10 && total != num * 10) {
                              if (pages == (total / 10) + 1) {
                                next = pages;//Khong next
                              } else {
                                next = pages + 1;//Co next
                              }
                            } else {
                              //Nếu fullPage đến trang cuối dừng
                              //Chưa tới trang cuối thì được next
                              if (pages == (total / 10)) {
                                next = pages;//Khong next
                              } else {
                                next = pages + 1;//Co next
                              }
                            }
                          }
                        %>
                      <li>
                          <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct?pages=<%=next%>">
                        <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Next">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                  clip-rule="evenodd"
                                  fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </a>
                      </li>
                    </ul>
                  </nav>
                </span>
          </div>
        </div>
      </div>
    </main>
  </div>
</div>
</body>
</html>
