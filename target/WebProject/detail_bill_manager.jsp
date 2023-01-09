<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi tiết hóa đơn</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="admin/assets/css/tailwind.output.css" />
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
              href="#"
            >
              Admin
            </a>
            <ul class="mt-6">
              <li class="relative px-6 py-3">
                <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="#"
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
                  <span class="ml-4">Quản lý</span>
                </a>
              </li>
            </ul>
            <ul>
              <li class="relative px-6 py-3">

                <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="ProductManagement.jsp"
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
                  <span class="ml-4">Quản lí sản phẩm</span>
                </a>
              </li>
              <li class="relative px-6 py-3">
                  <span
                  class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                  aria-hidden="true"
                ></span>
                <a
                        class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                        href="bill_manager.jsp"
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
                  <span class="ml-4">Quản lí hóa đơn</span>
                </a>
              </li>
              <li class="relative px-6 py-3">

                <a
                        class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                        href="customer_manager.jsp"
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
                  <span class="ml-4">Quản lí khách hàng</span>
                </a>
              </li>
            </ul>
            <div class="px-6 my-6">
              <button
                class="flex items-center justify-between w-full px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
              >
                Tạo mới sản phẩm
                <span class="ml-2" aria-hidden="true">+</span>
              </button>
            </div>
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

                <!-- Profile menu -->
              </ul>
            </div>
          </header>
          <main class="h-full pb-16 overflow-y-auto">
            <div class="container grid px-6 mx-auto">

              <h2 class="text-2xl font-semibold text-gray-700 dark:text-gray-200" style= "font-size: 1rem;margin-top: 50px"><a href="bill_manager.jsp">Quản lý hóa đơn </a><span style="font-size: 1rem;color: rgb(183, 183, 183);">/ Chi tiết hóa đơn</span></h2>
              <!-- With actions -->

              <br><br>
              <%
                Bill bill = (Bill)request.getAttribute("detail_bill");
              %>
              <h2 class="my-6 text-2xl font-semibold text-gray-300 dark:text-gray-200" style="font-size: medium;font-weight: normal">
                ID: <%=bill.getId()%>
              <br><br>
                Tên: <%=ProductService.getCustomer(bill.getId_cus()).getName()%>
              </h2>
              <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                  <table class="w-full whitespace-no-wrap">
                    <thead>
                      <tr
                        class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                      >
                        <th class="px-4 py-3">Tên sản phẩm</th>
                        <th class="px-4 py-3">Đơn giá</th>
                        <th class="px-4 py-3">Kích cở</th>
                        <th class="px-4 py-3">Màu sắc</th>
                        <th class="px-4 py-3">Số lượng</th>
                        <th class="px-4 py-3">Ngày lập đơn</th>
                      </tr>
                    </thead>
                    <tbody
                      class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                    >
                    <%
                      NumberFormat nf = new NumberFormat();
                      for(String s: bill.getProductList()){
                        Product p = ProductService.getProduct(ProductService.getIdProduct(s));
                    %>
                      <tr class="text-gray-700 dark:text-gray-400">
                        <td class="px-4 py-3 text-sm">
                          <%=p.getName()%>
                        </td>
                        <td class="px-4 py-3 text-sm">
                          <%=nf.numberFormat((long)(p.getPrice()-p.getPrice()*p.getDiscount()))%>đ
                         </td>
                        <td class="px-4 py-3 text-sm">
                          <%=ProductService.getSize(s)%>
                        </td>
                        <td class="px-4 py-3 text-sm">
                          <%=ProductService.getColor(s)%>
                        </td>
                        <td class="px-4 py-3 text-sm">
                         <%=ProductService.getQuantity(bill.getId(),s)%>
                        </td>
                        <td class="px-4 py-3 text-sm">
                          15/10/2022
                        </td>
                      </tr>
                    <%}%>
                    </tbody>
                  </table>
                </div>
                <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
              >
                <span class="flex items-center col-span-3">
                  <% long price = 0;
                    for(String id_dp:bill.getProductList()){
                      Product p = ProductService.getProduct(ProductService.getIdProduct(id_dp));
                      price += p.getPrice()-p.getPrice()*p.getDiscount();
                    }
                    %>
                  Tồng tiền: <%=nf.numberFormat(price)%>đ
                </span>
                <span class="col-span-2"></span>
                <!-- Pagination -->

              </div>
              </div>
            </div>
          </main>
        </div>
      </div>
  </body>
</html>
