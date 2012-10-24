package ar.iariel.siscom.model.bean;

/**
 * 
 * @author Ariel Duarte
 *
 */
public class Articulo {
	
	private Integer codigo;
	private String artbarra;
	private Grupo grupo;
	private TipoGrupo tipoGrupo;
	private String artnomreal;
	private String artnomfact;
	private String artcodorigen;
	private String artnropieza;
	private Marca marca;
	private String codigomarca;
	private Pais pais;
	private Double artprecact;
	private Double artpreant;
	private Double artpreventa;
	private String arttpiva;
	private Ubicacion ubicacion;
	private Double artstockmin;
	private String artobs;
	private Double artivaporc;
	
	
	
	public Grupo getGrupo() {
		return grupo;
	}
	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
	public TipoGrupo getTipoGrupo() {
		return tipoGrupo;
	}
	public void setTipoGrupo(TipoGrupo tipoGrupo) {
		this.tipoGrupo = tipoGrupo;
	}
	public Ubicacion getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(Ubicacion ubicacion) {
		this.ubicacion = ubicacion;
	}
	public Marca getMarca() {
		return marca;
	}
	public void setMarca(Marca marca) {
		this.marca = marca;
	}
	public Pais getPais() {
		return pais;
	}
	public void setPais(Pais pais) {
		this.pais = pais;
	}
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getArtbarra() {
		return artbarra;
	}
	public void setArtbarra(String artbarra) {
		this.artbarra = artbarra;
	}
	
	public String getArtnomreal() {
		return artnomreal;
	}
	public void setArtnomreal(String artnomreal) {
		this.artnomreal = artnomreal;
	}
	public String getArtnomfact() {
		return artnomfact;
	}
	public void setArtnomfact(String artnomfact) {
		this.artnomfact = artnomfact;
	}
	public String getArtcodorigen() {
		return artcodorigen;
	}
	public void setArtcodorigen(String artcodorigen) {
		this.artcodorigen = artcodorigen;
	}
	public String getArtnropieza() {
		return artnropieza;
	}
	public void setArtnropieza(String artnropieza) {
		this.artnropieza = artnropieza;
	}

	public String getCodigomarca() {
		return codigomarca;
	}
	public void setCodigomarca(String codigomarca) {
		this.codigomarca = codigomarca;
	}

	public Double getArtprecact() {
		return artprecact;
	}
	public void setArtprecact(Double artprecact) {
		this.artprecact = artprecact;
	}
	public Double getArtpreant() {
		return artpreant;
	}
	public void setArtpreant(Double artpreant) {
		this.artpreant = artpreant;
	}
	public Double getArtpreventa() {
		return artpreventa;
	}
	public void setArtpreventa(Double artpreventa) {
		this.artpreventa = artpreventa;
	}
	public String getArttpiva() {
		return arttpiva;
	}
	public void setArttpiva(String arttpiva) {
		this.arttpiva = arttpiva;
	}

	public Double getArtstockmin() {
		return artstockmin;
	}
	public void setArtstockmin(Double artstockmin) {
		this.artstockmin = artstockmin;
	}
	public String getArtobs() {
		return artobs;
	}
	public void setArtobs(String artobs) {
		this.artobs = artobs;
	}
	public Double getArtivaporc() {
		return artivaporc;
	}
	public void setArtivaporc(Double artivaporc) {
		this.artivaporc = artivaporc;
	}
	
	
	

}
