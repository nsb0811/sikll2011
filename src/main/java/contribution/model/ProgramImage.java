package contribution.model;

public class ProgramImage {

	int program_id;
	String organization_id;
	String stored_file_name;
	String image_url;
	String original_file_name;
	
	public int getProgram_id() {
		return program_id;
	}
	public void setProgram_id(int program_id) {
		this.program_id = program_id;
	}
	public String getOrganization_id() {
		return organization_id;
	}
	public void setOrganization_id(String organization_id) {
		this.organization_id = organization_id;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	@Override
	public String toString() {
		return "ProgramImage [program_id=" + program_id + ", organization_id=" + organization_id + ", stored_file_name="
				+ stored_file_name + ", image_url=" + image_url + ", original_file_name=" + original_file_name + "]";
	}

	
}
