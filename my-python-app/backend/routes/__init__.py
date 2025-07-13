from flask import Blueprint, request, jsonify
from models import YourModel  # Substitua 'YourModel' pelo nome do seu modelo

bp = Blueprint('routes', __name__)

@bp.route('/data', methods=['POST'])
def create_data():
    data = request.json
    new_entry = YourModel(**data)  # Ajuste conforme a estrutura do seu modelo
    new_entry.save()  # Método para salvar no banco de dados
    return jsonify({'message': 'Entry created successfully'}), 201

@bp.route('/data', methods=['GET'])
def get_data():
    entries = YourModel.query.all()  # Ajuste conforme a estrutura do seu modelo
    return jsonify([entry.to_dict() for entry in entries])  # Método para converter para dicionário
