function PlantCard({ plant, onDeletePlant, onUpdatePlant }) {
  const { id, name, image, price, is_in_stock: isInStock } = plant;

  function handleDeleteClick() {
    fetch(`http://localhost:3000/plants/${id}`, {
      method: "DELETE",
    });

    onDeletePlant(id);
  }

  function handleIsInStockClick() {
    fetch(`http://localhost:3000/plants/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ is_in_stock: !isInStock }),
    })
      .then((r) => r.json())
      .then((updatedPlant) => {
        onUpdatePlant(updatedPlant);
      });
  }

  return (
    <li className="card">
      <img src={image} alt={name} />
      <h4>{name}</h4>
      <p>Price: {price}</p>
      {isInStock ? (
        <button className="primary" onClick={handleIsInStockClick}>
          In Stock
        </button>
      ) : (
        <button onClick={handleIsInStockClick}>Out of Stock</button>
      )}
      <button onClick={handleDeleteClick}>Delete</button>
    </li>
  );
}

export default PlantCard;
