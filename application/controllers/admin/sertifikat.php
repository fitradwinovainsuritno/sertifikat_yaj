<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class sertifikat extends CI_Controller {

	public function __construct() {

		parent::__construct();
		
		$this->load-> model ('M_sertifikat');

		$this->load-> model ('M_event');

		if (!$this->session->userdata('username')) {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Login First!</div>');
            redirect('admin');
        }
		
	}

	public function index()
	{
		$profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

		$title['title'] = 'Certificates - Certificate Online';

		$year['year'] = date('Y');

		$certificate = $this->M_sertifikat->getDataCertificate();
		$event = $this->M_event->getDataEvent();
		$users = $this->db->query("SELECT * FROM users WHERE level='user'")->result();

		$data['certificate'] = $certificate;
		$data['event'] = $event;
		$data['users'] = $users;

		$this->load->view('admin/partials/_header', $title);
		$this->load->view('admin/partials/_navbar', $profil);
		$this->load->view('admin/partials/_sidebar');
		$this->load->view('admin/sertifikat/sertifikat', $data);
		$this->load->view('admin/partials/_footer', $year);
	}

	public function edit  ($id)
	{
		$profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

		$title['title'] = 'Edit Certificates - Certificate Online';

		$year['year'] = date('Y');

		$certificate = $this->M_sertifikat->getDataCertificateDetail($id);

		$data['certificate'] = $certificate;

		$this->load->view('admin/partials/_header', $title);
		$this->load->view('admin/partials/_navbar', $profil);
		$this->load->view('admin/partials/_sidebar');
		$this->load->view('admin/sertifikat/edit', $data);
		$this->load->view('admin/partials/_footer', $year);
	}

	public function fungsi_tambah()
    {
        $profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

        $participant_name = $this->input->post('participant_name');
        $event_name = $this->input->post('event_name');
        $event_date = $this->input->post('event_date');
        $certificate_text = $this->input->post('certificate_text');

        $ArrInsert = array(
            'participant_name' => $participant_name,
            'event_name' => $event_name,
            'event_date' => $event_date,
            'certificate_text' => $certificate_text
        );

        $this->M_sertifikat->insertDataCertificate($ArrInsert);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Certificate added successfully!</div>');
		redirect($_SERVER['HTTP_REFERER']);
    }

	public function fungsi_edit()
    {
        $profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

        $id = $this->input->post('certificate_id');
        $participant_name = $this->input->post('participant_name');
        $event_name = $this->input->post('event_name');
        $event_date = $this->input->post('event_date');
        $certificate_text = $this->input->post('certificate_text');

        $ArrUpdate = array(
            'certificate_id' => $id,
            'participant_name' => $participant_name,
            'event_name' => $event_name,
            'event_date' => $event_date,
            'certificate_text' => $certificate_text
        );

        $this->M_sertifikat->updateDataCertificate($id, $ArrUpdate);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Certificate edited successfully!</div>');
        redirect(base_url('admin/sertifikat'));
    }

	public function hapus($id)
    {
        $profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

        $this->M_sertifikat->hapusDataCertificate($id);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Certificate deleted successfully!</div>');

        redirect($_SERVER['HTTP_REFERER']);
    }
}