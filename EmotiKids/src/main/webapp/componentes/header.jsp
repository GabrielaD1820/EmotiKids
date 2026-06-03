<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.model.Usuario" %>
<%
Object usuarioObj = session.getAttribute("usuario");
%>

<header>
    <div class="header-top">
        <div>
            <h1>EmotiKids 🌟</h1>
            <p>Aprende a reconocer y controlar tus emociones de forma divertida</p>
        </div>
        <div class="logo">
            <a href="<%=request.getContextPath()%>/index.jsp">
                <!-- Si no tienes logo.png, saldrá roto. Asegúrate de tenerlo en la carpeta img -->
                <img src="<%=request.getContextPath()%>/img/logo.png" alt="Logo EmotiKids" onerror="this.src='https://cdn-icons-png.flaticon.com/512/3076/3076134.png';">
            </a>
        </div>
    </div>

    <nav>
        <ul style="align-items: center;">
            <li><a href="<%=request.getContextPath()%>/index.jsp">🏠 Inicio</a></li>

            <% if (usuarioObj == null) { %>
                <li><a href="<%=request.getContextPath()%>/login.jsp">🔑 Iniciar Sesión</a></li>
                <li><a href="<%=request.getContextPath()%>/registro.jsp">📝 Registro</a></li>
                <li class="dropdown">
                    <a href="#">😊 Emociones ▼</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/requiereLogin.jsp">Alegría</a></li>
                        <li><a href="<%=request.getContextPath()%>/requiereLogin.jsp">Tristeza</a></li>
                        <li><a href="<%=request.getContextPath()%>/requiereLogin.jsp">Enojo</a></li>
                        <li><a href="<%=request.getContextPath()%>/requiereLogin.jsp">Miedo</a></li>
                    </ul>
                </li>
                <li><a href="<%=request.getContextPath()%>/requiereLogin.jsp">🎮 Actividades</a></li>

            <% } else if ("ADMIN".equals(((Usuario) usuarioObj).getRol())) { %>
                <li><a href="<%=request.getContextPath()%>/admin/inicioAdmin.jsp">⚙️ Panel Admin</a></li>
                <li><a href="<%=request.getContextPath()%>/ListarUsuariosServlet">👥 Usuarios</a></li>
                <li><a href="<%=request.getContextPath()%>/ListarBitacoraServlet">📋 Bitácora</a></li>
                <li class="dropdown">
                    <a href="#">😊 Emociones ▼</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/emociones/alegria.jsp">Alegría</a></li>
                        <li><a href="<%=request.getContextPath()%>/emociones/tristeza.jsp">Tristeza</a></li>
                        <li><a href="<%=request.getContextPath()%>/emociones/enojo.jsp">Enojo</a></li>
                        <li><a href="<%=request.getContextPath()%>/emociones/miedo.jsp">Miedo</a></li>
                    </ul>
                </li>
                <li><a href="<%=request.getContextPath()%>/actividades/actividades.jsp">🎮 Actividades</a></li>
                <li><a href="<%=request.getContextPath()%>/CerrarSesionServlet">🚪 Salir</a></li>

            <% } else { %>
                <li class="dropdown">
                    <a href="#">😊 Emociones ▼</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/emociones/alegria.jsp">Alegría</a></li>
                        <li><a href="<%=request.getContextPath()%>/emociones/tristeza.jsp">Tristeza</a></li>
                        <li><a href="<%=request.getContextPath()%>/emociones/enojo.jsp">Enojo</a></li>
                        <li><a href="<%=request.getContextPath()%>/emociones/miedo.jsp">Miedo</a></li>
                    </ul>
                </li>
                <li><a href="<%=request.getContextPath()%>/actividades/actividades.jsp">🎮 Actividades</a></li>
                <li><a href="<%=request.getContextPath()%>/estudiante/inicioEstudiante.jsp">👤 Mi Perfil</a></li>
                <li><a href="<%=request.getContextPath()%>/CerrarSesionServlet">🚪 Salir</a></li>
            <% } %>

            <!-- BOTÓN DE MODO OSCURO (Aparece para todos) -->
            <li>
                <button id="btn-dark-mode" onclick="toggleDarkMode()" style="background-color: #2C3E50; color: #FFF; border: none; padding: 10px 20px; border-radius: 20px; font-size: 18px; cursor: pointer; font-family: 'Fredoka', sans-serif; box-shadow: 0 4px 0px #1A252F; transition: 0.2s;">
                    🌓 Modo Oscuro
                </button>
            </li>
        </ul>
    </nav>
</header>

<!-- Lógica del Modo Oscuro -->
<script>
    // Al cargar la página, revisa si el niño había activado el modo oscuro antes
    document.addEventListener("DOMContentLoaded", function() {
        if(localStorage.getItem('modoOscuro') === 'activado') {
            document.body.setAttribute('data-theme', 'dark');
            document.getElementById('btn-dark-mode').innerText = "☀️ Modo Claro";
        }
    });

    // Función para cambiar entre modos
    function toggleDarkMode() {
        let btn = document.getElementById('btn-dark-mode');
        if (document.body.getAttribute('data-theme') === 'dark') {
            document.body.removeAttribute('data-theme');
            localStorage.setItem('modoOscuro', 'desactivado');
            btn.innerText = "🌓 Modo Oscuro";
        } else {
            document.body.setAttribute('data-theme', 'dark');
            localStorage.setItem('modoOscuro', 'activado');
            btn.innerText = "☀️ Modo Claro";
        }
    }
</script>