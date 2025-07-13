const form = document.getElementById("dataForm");
const resultDiv = document.getElementById("response");

form.addEventListener("submit", async (event) => {
  event.preventDefault();

  const formData = new FormData(form);
  const data = Object.fromEntries(formData.entries());

  try {
    const response = await fetch("http://localhost:5000/entries", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        nome: data.name,
        email: data.email,
      }),
    });

    if (response.ok) {
      const result = await response.json();
      resultDiv.innerHTML = `<p>Dados salvos com sucesso! ID: ${result.id}</p>`;
      form.reset();
      fetchData();
    } else {
      resultDiv.innerHTML = "<p>Erro ao salvar dados.</p>";
    }
  } catch (error) {
    resultDiv.innerHTML = `<p>Erro: ${error.message}</p>`;
  }
});

async function fetchData() {
  try {
    const response = await fetch("http://localhost:5000/entries");
    if (response.ok) {
      const data = await response.json();
      let html = "<h2>Entradas salvas:</h2>";
      if (data.length === 0) {
        html += "<p>Nenhuma entrada encontrada.</p>";
      } else {
        html += "<table border='1'>";
        html += "<tr><th>ID</th><th>Nome</th><th>Email</th></tr>";
        data.forEach((entry) => {
          html += `<tr><td>${entry.id}</td><td>${entry.nome}</td><td>${entry.email}</td></tr>`;
        });
        html += "</table>";
      }
      resultDiv.innerHTML = html;
    } else {
      resultDiv.innerHTML = "<p>Erro ao carregar dados.</p>";
    }
  } catch (error) {
    resultDiv.innerHTML = `<p>Erro: ${error.message}</p>`;
  }
}

fetchData();
